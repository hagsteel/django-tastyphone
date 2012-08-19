//
//  CreateQuestionViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreateQuestionViewController.h"

@interface CreateQuestionViewController ()

@end

@implementation CreateQuestionViewController

@synthesize questionCommand;
@synthesize pollId;
@synthesize questionName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)createQuestion:(id)sender {
	if (self.questionCommand == nil) {
		self.questionCommand = [QuestionCommand new];
		self.questionCommand.delegate = self;
	}

	Question *q = [Question new];
	q.pollId = self.pollId;
	q.question = self.questionName.text;
	[self.questionCommand createQuestion:q];
}

- (void)dealloc {
	[self.questionCommand release];
	[questionName release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setQuestionName:nil];
	[super viewDidUnload];
}
@end
