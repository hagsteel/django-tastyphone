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
@property (nonatomic, retain) PollCommand* pollCommand;
@end

@implementation PollViewController

@synthesize pollCommand;
@synthesize polls;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.polls = [NSArray new];
	
	if (self.pollCommand == nil) {
		self.pollCommand = [PollCommand new];
		self.pollCommand.delegate = self;
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[self showLoader];
	[self.pollCommand getPollList];
}

- (IBAction)editPolls:(id)sender {
	if (self.tableView.editing == YES)
		[self.tableView setEditing:NO animated:YES];
	else
		[self.tableView setEditing:YES animated:YES];
}


#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	if ([object isKindOfClass:[NSArray class]]) {
		self.polls = object;
	} else {
		[self.pollCommand getPollList];
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
		Poll* p = [self.polls objectAtIndex:selectedIndexPath.row];
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
	if (self.polls == nil)
		return 0;
	return [self.polls count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"pollCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] init];
	
	Poll *poll = [self.polls objectAtIndex:indexPath.row];
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
		Poll *poll = [self.polls objectAtIndex:indexPath.row];
		if (poll == nil)
			return;
		[self.pollCommand deletePoll:[NSString stringWithFormat:@"%d", poll.pollId]];				
    }
}



- (void)dealloc {
	[pollCommand release];
	[polls release];
	[super dealloc];
}

@end
