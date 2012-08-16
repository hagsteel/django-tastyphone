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

#pragma mark - Api command delegate

- (void)dataReceived:(id)object {
	[self hideLoader];
	self.polls = object;
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


- (void)dealloc {
	[pollCommand release];
	[polls release];
	[super dealloc];
}

@end
