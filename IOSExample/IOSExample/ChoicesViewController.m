//
//  ChoicesViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 17/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "ChoicesViewController.h"
#import "CreateChoiceViewController.h"

@implementation ChoicesViewController

@synthesize question;
//@synthesize choices;
//@synthesize choiceCommand;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (_choiceCommand == nil) {
		_choiceCommand = [ChoiceCommand new];
		_choiceCommand.delegate = self;
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[self showLoader];
	[_choiceCommand getChoiceByQuestion:[NSString stringWithFormat:@"%d", question.questionId]];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"add choice"])
	{
		CreateChoiceViewController *createChoiceViewController = segue.destinationViewController;
		createChoiceViewController.questionId = question.questionId;
	}
}

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	if ([object isKindOfClass:[NSArray class]]) {
		_choices = [object copy];
	}
	[self.tableView reloadData];
}

- (void)apiErrorReceived:(ApiError *)error {
	[self hideLoader];
}

- (void)connectionError {
	[self hideLoader];
}

#pragma mark - Table view


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_choices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"choiceCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	Choice* choice = [_choices objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ - %d", choice.description, choice.count];
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
	Choice* choice = [_choices objectAtIndex:indexPath.row];
	choice.count++;
	[_choiceCommand updateChoice:choice withId:[NSString stringWithFormat:@"%d", choice.choiceId]];
}

- (void)dealloc {
	[question release];
	[_choices release];
	[_choiceCommand release];
	[super dealloc];
}

@end
