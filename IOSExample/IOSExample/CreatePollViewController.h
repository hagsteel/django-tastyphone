//
//  CreatePollViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "PollCommand.h"

@interface CreatePollViewController : TableViewControllerWithLoader <ApiCommandDelegate> {
	PollCommand *pollCommand;
}

@property (retain, nonatomic) IBOutlet UITextField *pollTitle;

- (IBAction)createPoll:(id)sender;
@end
