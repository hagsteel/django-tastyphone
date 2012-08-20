//
//  AuthenticationProvider.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "AuthenticationProvider.h"

//////////////////////////////////
// Shared Instance

static AuthenticationProvider* sharedAuthenticationProvider = nil;

///////////////////////////////////

@implementation AuthenticationProvider

- (id)init {
	self = [super init];
	if (self) {
		
	}
	return self;
}

+ (AuthenticationProvider*)sharedInstance {
	if (sharedAuthenticationProvider == nil)
		sharedAuthenticationProvider = [[AuthenticationProvider alloc] init];
	
	return sharedAuthenticationProvider;
}

- (id<AuthenticationProtocol>)getAuthenticator {
	[NSException raise:@"not implemented yet" format:@"not implemented yet"];
	return nil;
}

@end
