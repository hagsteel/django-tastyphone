//
//  CreateChoiceViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "ChoiceCommand.h"

@interface CreateChoiceViewController : TableViewControllerWithLoader <ApiCommandDelegate>
@property (nonatomic, assign) NSInteger questionId;
@property (nonatomic, retain) ChoiceCommand *choiceCommand;
@property (retain, nonatomic) IBOutlet UITextField *choiceDescription;

- (IBAction)createChoice:(id)sender;

@end
