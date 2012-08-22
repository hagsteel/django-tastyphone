//
//  
//
//  Created by tastyphone on 22/8/2012.
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
