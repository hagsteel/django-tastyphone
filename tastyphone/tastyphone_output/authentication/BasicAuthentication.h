//
//  
//
//  Created by tastyphone on 23/8/2012.
//

#import <Foundation/Foundation.h>
#import "AuthenticationProtocol.h"
#import "CredentialStorageProtocol.h"

@interface BasicAuthentication : NSObject <AuthenticationProtocol> {
	id<CredentialStorageProtocol> _storage;
}

- (id)initWithCredentialStore:(id<CredentialStorageProtocol>)storage;

@end
