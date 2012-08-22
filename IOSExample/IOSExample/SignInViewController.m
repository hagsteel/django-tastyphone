//
//  SignInViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 22/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController
@synthesize signinField;
@synthesize passwordField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)signInToApi:(id)sender {
	if (_signInCommand == nil) {
		_signInCommand = [[SigninCommand alloc] init];
		_signInCommand.delegate = self;
	}
	
	Signin *signIn = [[Signin alloc] init];
	signIn.username = self.signinField.text;
	signIn.password = self.passwordField.text;
//	[_signInCommand get by username and password
	[signIn release];
}

#pragma mark - sign in command

- (void)dataReceived:(id)object {
	
}

- (void)apiErrorReceived:(ApiError *)error {
	
}


- (void)dealloc {
	[signinField release];
	[passwordField release];
	[super dealloc];
}
- (void)viewDidUnload {
	[self setSigninField:nil];
	[self setPasswordField:nil];
	[super viewDidUnload];
}
@end
