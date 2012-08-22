//
//  SignInViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 22/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "SignInCommand.h"

@interface SignInViewController : TableViewControllerWithLoader <ApiCommandDelegate> {
	SigninCommand *_signInCommand;
}

@property (retain, nonatomic) IBOutlet UITextField *signinField;
@property (retain, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signInToApi:(id)sender;
@end
