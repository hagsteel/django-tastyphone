//
//  QuestionViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 16/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "QuestionCommand.h"
#import "Poll.h"

@interface QuestionViewController : TableViewControllerWithLoader <ApiCommandDelegate> {
	QuestionCommand *_questionCommand;
	NSArray *_questions;
}

@property (nonatomic, retain) Poll *poll;

@end
