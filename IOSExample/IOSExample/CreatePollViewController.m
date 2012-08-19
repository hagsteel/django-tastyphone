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

//@synthesize pollCommand;
@synthesize pollTitle;

- (void)viewDidLoad
{
    [super viewDidLoad];
	if (pollCommand == nil) {
		pollCommand = [[PollCommand alloc] init];
		pollCommand.delegate = self;
	}
	// Do any additional setup after loading the view.
}

- (IBAction)createPoll:(id)sender {
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
