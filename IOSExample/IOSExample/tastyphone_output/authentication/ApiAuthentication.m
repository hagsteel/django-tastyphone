//
//  ApiAuthentication.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "ApiAuthentication.h"

@implementation ApiAuthentication
- (id)initWithCredentialStore:(id<CredentialStorageProtocol>)storage {
	self = [super init];
	if (self) {
		_storage = storage;
	}
	return self;
}

- (id)init {
	[NSException raise:@"use initWithCredentialStore to ensure there is a credential store available" format:@"use initWithCredentialStore to ensure there is a credential store available"];
	return nil;
}

- (NSDictionary *)getAuthenticationHeaders {
	return [_storage getCredentials];
}
@end
