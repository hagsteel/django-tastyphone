//
//  
//
//  Created by tastyphone on 23/8/2012.
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
