//
//  CreateChoiceViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreateChoiceViewController.h"

@implementation CreateChoiceViewController

@synthesize choiceDescription;
@synthesize questionId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)createChoice:(id)sender {
	if (_choiceCommand == nil) {
		_choiceCommand = [ChoiceCommand new];
		_choiceCommand.delegate = self;
	}
	Choice *choice = [Choice new];
	choice.questionId = self.questionId;
	choice.description = self.choiceDescription.text;
	[_choiceCommand createChoice:choice];
	[choice release];
}

- (void)dealloc {
	[_choiceCommand release];
	[choiceDescription release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setChoiceDescription:nil];
	[super viewDidUnload];
}
@end
