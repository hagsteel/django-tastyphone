//
//  QuestionViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

@synthesize pollId;
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
	[self.questionCommand getQuestionByPoll:self.pollId];
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
	if ([segue.identifier isEqualToString:@"view qestions"])
	{
//		SettingsViewController *playerDetailsViewController = segue.destinationViewController;
//		playerDetailsViewController.delegate = self;
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
    static NSString *cellIdentifier = @"questionIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] init];
	
	Question *question = [self.questions objectAtIndex:indexPath.row];
	cell.textLabel.text = question.question;
    return cell;
}


- (void)dealloc {
	[self.pollId release];
	[self.questionCommand release];
	[self.questions release];
	[super dealloc];
}

@end
