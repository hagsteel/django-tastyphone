//
//  
//
//  Created by tastyphone on 22/8/2012.
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

- (void)saveCredentials:(NSString*)username withApiKey:(NSString*)apiKey {
	if ([username length] > 0 && [apiKey length] > 0)
		return;

	NSDictionary *credentials = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:username, apiKey, nil]
															forKeys:[NSArray arrayWithObjects:@"key", @"value", nil]];
	[_storage saveCredentials:credentials];
}
@end
