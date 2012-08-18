//
//  QuestionViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "QuestionViewController.h"
#import "ChoicesViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

@synthesize poll;
@synthesize questionCommand;
@synthesize questions;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.questions = [NSArray new];
	
	if (self.questionCommand == nil) {
		self.questionCommand = [QuestionCommand new];
		self.questionCommand.delegate = self;
	}

}

- (void)viewDidAppear:(BOOL)animated {
	[self showLoader];
	[self.questionCommand getQuestionByPoll:[NSString stringWithFormat:@"%d", self.poll.PollId]];
}

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	self.questions = object;
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
		Question* q = [self.questions objectAtIndex:selectedIndexPath.row];
		choicesViewController.question = q;
	}
}

#pragma mark - Table view


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"questionCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] init];
	
	Question *question = [self.questions objectAtIndex:indexPath.row];
	cell.textLabel.text = question.question;
    return cell;
}


- (void)dealloc {
	[self.poll release];
	[self.questionCommand release];
	[self.questions release];
	[super dealloc];
}

@end
