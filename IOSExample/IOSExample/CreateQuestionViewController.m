//
//  CreateQuestionViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreateQuestionViewController.h"

@implementation CreateQuestionViewController

@synthesize pollId;
@synthesize questionName;

- (IBAction)createQuestion:(id)sender {
	if (_questionCommand == nil) {
		_questionCommand = [[QuestionCommand alloc] init];
		_questionCommand.delegate = self;
	}

	Question *q = [[Question alloc] init];
	q.pollId = self.pollId;
	q.question = self.questionName.text;
	[_questionCommand createQuestion:q];
	[q release];
}

- (void)dealloc {
	[_questionCommand release];
	[questionName release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setQuestionName:nil];
	[super viewDidUnload];
}
@end
