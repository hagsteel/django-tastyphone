//
//  
//
//  Created by tastyphone on 22/8/2012.
//

#import <Foundation/Foundation.h>
#import "AuthenticationProtocol.h"
#import "CredentialStorageProtocol.h"

@interface ApiAuthentication : NSObject <AuthenticationProtocol> {
	id<CredentialStorageProtocol> _storage;
}
- (id)initWithCredentialStore:(id<CredentialStorageProtocol>)storage;
- (void)saveCredentials:(NSString*)username withApiKey:(NSString*)apiKey;
@end
