//
//  CreateQuestionViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 19/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "QuestionCommand.h"
#import "Poll.h"

@interface CreateQuestionViewController : TableViewControllerWithLoader <ApiCommandDelegate>
@property (nonatomic, retain) QuestionCommand *questionCommand;
@property (nonatomic, assign) NSInteger	pollId;

@property (retain, nonatomic) IBOutlet UITextField *questionName;

- (IBAction)createQuestion:(id)sender;
@end
