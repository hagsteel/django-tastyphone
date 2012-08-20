//
//  CreatePollViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreatePollViewController.h"

@implementation CreatePollViewController

@synthesize pollTitle;

- (IBAction)createPoll:(id)sender {
	if (pollCommand == nil) {
		pollCommand = [[PollCommand alloc] init];
		pollCommand.delegate = self;
	}

	Poll *p = [[Poll alloc] init];
	p.title = self.pollTitle.text;
	[pollCommand createPoll:p];
	[p release];
}

- (void)dealloc {
	[pollCommand release];
	[pollTitle release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setPollTitle:nil];
	[super viewDidUnload];
}
@end
