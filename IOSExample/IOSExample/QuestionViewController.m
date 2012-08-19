//
//  QuestionViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "QuestionViewController.h"
#import "ChoicesViewController.h"
#import "CreateQuestionViewController.h"

@implementation QuestionViewController

@synthesize poll;

- (void)viewDidLoad
{
    [super viewDidLoad];
	_questions = [[NSArray alloc] init];
	
	if (_questionCommand == nil) {
		_questionCommand = [[QuestionCommand alloc] init];
		_questionCommand.delegate = self;
	}

}

- (void)viewDidAppear:(BOOL)animated {
	[self showLoader];
	[_questionCommand getQuestionByPoll:[NSString stringWithFormat:@"%d", poll.pollId]];
}

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	_questions = [object copy];
	[self.tableView reloadData];
}

- (void)apiErrorReceived:(ApiError *)error {
	[self hideLoader];
}

- (void)connectionError {
	[self hideLoader];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"view choices"])
	{
		ChoicesViewController *choicesViewController = segue.destinationViewController;
		NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
		Question* q = [_questions objectAtIndex:selectedIndexPath.row];
		choicesViewController.question = q;
	}
	
	if ([segue.identifier isEqualToString:@"add question"])
	{
		CreateQuestionViewController *createQuestionViewController = segue.destinationViewController;
		createQuestionViewController.pollId = poll.pollId;
	}
}

#pragma mark - Table view


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"questionCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	Question *question = [_questions objectAtIndex:indexPath.row];
	cell.textLabel.text = question.question;
    return cell;
}


- (void)dealloc {
	[poll release];
	[_questionCommand release];
	[_questions release];
	[super dealloc];
}

@end
