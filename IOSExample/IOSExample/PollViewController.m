//
//  PollViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "PollViewController.h"
#import "QuestionViewController.h"

@interface PollViewController ()
- (void)getPolls;
@end

@implementation PollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_polls = [[NSArray alloc] init];
	
	if (_pollCommand == nil) {
		_pollCommand = [PollCommand new];
		_pollCommand.delegate = self;
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[self showLoader];
	[self getPolls];
}

- (IBAction)editPolls:(id)sender {
	if (self.tableView.editing == YES)
		[self.tableView setEditing:NO animated:YES];
	else
		[self.tableView setEditing:YES animated:YES];
}


- (void)getPolls {
	[_pollCommand getPollList];
}

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	static int retryCount = 3;
	[self hideLoader];
	if ([object isKindOfClass:[NSArray class]]) {
		_polls = [object copy];
		retryCount = 3;
	} else if (object == nil && retryCount > 0) {
		[_pollCommand getPollList];
		retryCount--;
	}
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
		QuestionViewController *questionViewController = segue.destinationViewController;
		NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
		Poll* p = [_polls objectAtIndex:selectedIndexPath.row];
		questionViewController.poll = p;
	}
}

#pragma mark - Table view


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (_polls == nil)
		return 0;
	return [_polls count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"pollCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	Poll *poll = [_polls objectAtIndex:indexPath.row];
	cell.textLabel.text = poll.title;
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
		Poll *poll = [_polls objectAtIndex:indexPath.row];
		if (poll == nil)
			return;
		[_pollCommand deletePoll:[NSString stringWithFormat:@"%d", poll.pollId]];				
    }
}

- (void)dealloc {
	[_pollCommand release];
	[_polls release];
	[super dealloc];
}

@end
