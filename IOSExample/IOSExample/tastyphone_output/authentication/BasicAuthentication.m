//
//  BasicAuthentication.m
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import "BasicAuthentication.h"

@implementation BasicAuthentication

- (id)initWithCredentialStore:(id<CredentialStorageProtocol>)storage {
	self = [super init];
	if (self) {
		_storage = storage;
	}
	return self;
}

- (NSDictionary *)getAuthenticationHeaders {
	NSDictionary *credentials = [_storage getCredentials];
	NSString *authStr = [NSString stringWithFormat:@"%@:%@", [credentials objectForKey:@"key"], [credentials objectForKey:@"value"]];
	NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
//	NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodingWithLineLength:80]];
	NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodingWithLineLength:80]];
	return [NSDictionary dictionaryWithObject:authValue forKey:@"Authorization"];
	/*
	 [theRequest setValue:authValue forHTTPHeaderField:@"Authorization"];
	 */
}

@end
