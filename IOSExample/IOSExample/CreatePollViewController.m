//
//  CreatePollViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreatePollViewController.h"

@interface CreatePollViewController ()

@end

@implementation CreatePollViewController

@synthesize pollCommand;
@synthesize pollTitle;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)createPoll:(id)sender {
	if (self.pollCommand == nil) {
		self.pollCommand = [PollCommand new];
		self.pollCommand.delegate = self;
	}
	Poll *p = [Poll new];
	p.title = self.pollTitle.text;
	[self.pollCommand createPoll:p];
}

- (void)dealloc {
	[self.pollCommand release];
	[pollTitle release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setPollTitle:nil];
	[super viewDidUnload];
}
@end
