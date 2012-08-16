//
//  QuestionViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "QuestionCommand.h"
#import "PollCommand.h"

@interface QuestionViewController : TableViewControllerWithLoader <ApiCommandDelegate>

@property (nonatomic, retain) NSString *pollId;
@property (nonatomic, retain) NSArray *questions;
@property (nonatomic, retain) QuestionCommand *questionCommand;
@end
