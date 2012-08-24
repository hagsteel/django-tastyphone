//
//  
//
//  Created by tastyphone on 23/8/2012.
//

#import <Foundation/Foundation.h>
#import "ApiAuthentication.h"
#import "BasicAuthentication.h"
#import "SqliteCredentialStore.h"

@interface AuthenticationProvider : NSObject {
	id<CredentialStorageProtocol> _credentialStore;
}

+ (AuthenticationProvider*)sharedInstance;
- (id<AuthenticationProtocol>)getApiAuthentication;
- (id<AuthenticationProtocol>)getBasicAuthentication;
@end
