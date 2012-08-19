//
//  PollViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "PollCommand.h"

@interface PollViewController : TableViewControllerWithLoader  <ApiCommandDelegate> {
	PollCommand* _pollCommand;
	NSArray *_polls;
}

- (IBAction)editPolls:(id)sender;

@end
