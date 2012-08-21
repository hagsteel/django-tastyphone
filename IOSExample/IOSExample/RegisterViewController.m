//
//  RegisterViewController.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 21/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize usernameField;
@synthesize passwordField;

- (IBAction)registerUser:(id)sender {
	if (_registrationCommand == nil) {
		_registrationCommand = [RegistrationCommand new];
		_registrationCommand.delegate = self;
	}
	Registration *reg = [[Registration alloc] init];
	reg.username = usernameField.text;
	reg.password = passwordField.text;
	[_registrationCommand createRegistration:reg];
	[reg release];
}


- (void)viewDidUnload
{
	[self setUsernameField:nil];
	[self setPasswordField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - registration command delegate

- (void)dataReceived:(id)object {
	NSLog(@"api key: %@", ((Registration*)object).apiKey);
}

- (void)apiErrorReceived:(ApiError *)error {
	NSLog(@"oops");
}

- (void)dealloc {
	[usernameField release];
	[passwordField release];
	[super dealloc];
}
@end
