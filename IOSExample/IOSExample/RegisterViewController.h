//
//  RegisterViewController.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 21/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "TableViewControllerWithLoader.h"
#import "RegistrationCommand.h"
#import "AuthenticationProvider.h"

@interface RegisterViewController : TableViewControllerWithLoader <ApiCommandDelegate> {
	RegistrationCommand *_registrationCommand;
}

@property (retain, nonatomic) IBOutlet UITextField *usernameField;
@property (retain, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)registerUser:(id)sender;

@end
