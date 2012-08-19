//
//  ChoicesViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 17/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "ChoicesViewController.h"

@interface ChoicesViewController ()

@end

@implementation ChoicesViewController

@synthesize question;
@synthesize choices;
@synthesize choiceCommand;

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
	if (self.choiceCommand == nil) {
		self.choiceCommand = [ChoiceCommand new];
		self.choiceCommand.delegate = self;
	}
	[self.choiceCommand getChoiceByQuestion:[NSString stringWithFormat:@"%d", self.question.questionId]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	if ([object isKindOfClass:[NSArray class]]) {
		self.choices = object;
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
	return [self.choices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"choiceCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] init];
	
	Choice* choice = [self.choices objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ - %d", choice.description, choice.count];
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
	Choice* choice = [self.choices objectAtIndex:indexPath.row];
	choice.count++;
	[self.choiceCommand updateChoice:choice withId:[NSString stringWithFormat:@"%d", choice.choiceId]];
}

- (void)dealloc {
	[self.question release];
	[self.choices release];
	[self.choiceCommand release];
	[super dealloc];
}

@end
