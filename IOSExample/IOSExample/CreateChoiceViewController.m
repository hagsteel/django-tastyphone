//
//  CreateChoiceViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "CreateChoiceViewController.h"

@interface CreateChoiceViewController ()

@end

@implementation CreateChoiceViewController

@synthesize choiceCommand;
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
	if (self.choiceCommand == nil) {
		self.choiceCommand = [ChoiceCommand new];
		self.choiceCommand.delegate = self;
	}
	Choice *choice = [Choice new];
	choice.questionId = self.questionId;
	choice.description = self.choiceDescription.text;
	[self.choiceCommand createChoice:choice];
}

- (void)dealloc {
	[self.choiceCommand release];
	[choiceDescription release];
	[super dealloc];
}

- (void)viewDidUnload {
	[self setChoiceDescription:nil];
	[super viewDidUnload];
}
@end
