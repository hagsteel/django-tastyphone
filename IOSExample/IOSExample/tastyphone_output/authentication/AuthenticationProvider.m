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
		_credentialStore = [[SqliteCredentialStore alloc] init];
	}
	return self;
}

+ (AuthenticationProvider*)sharedInstance {
	if (sharedAuthenticationProvider == nil)
		sharedAuthenticationProvider = [[AuthenticationProvider alloc] init];
	
	return sharedAuthenticationProvider;
}

- (id<AuthenticationProtocol>)getApiAuthentication {
	ApiAuthentication *apiAuth = [[[ApiAuthentication alloc] initWithCredentialStore:_credentialStore] autorelease];
	return apiAuth;
}

- (id<AuthenticationProtocol>)getBasicAuthentication {
	BasicAuthentication *basicAuth = [[[BasicAuthentication alloc] initWithCredentialStore:_credentialStore] autorelease];
	return basicAuth;
}

@end
