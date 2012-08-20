//
//  AuthenticationProvider.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
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
