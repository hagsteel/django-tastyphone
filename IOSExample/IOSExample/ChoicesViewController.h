//
//  ChoicesViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 17/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "ChoiceCommand.h"
#import "Question.h"

@interface ChoicesViewController : TableViewControllerWithLoader <ApiCommandDelegate> {
	NSArray *_choices;
	ChoiceCommand *_choiceCommand;
}
//@property (nonatomic, retain) NSArray *choices;
@property (nonatomic, retain) Question *question;
//@property (nonatomic, retain) 

@end
