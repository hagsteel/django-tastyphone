//
//  BasicAuthentication.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthenticationProtocol.h"
#import "CredentialStorageProtocol.h"

@interface BasicAuthentication : NSObject <AuthenticationProtocol> {
	id<CredentialStorageProtocol> _storage;
}

- (id)initWithCredentialStore:(id<CredentialStorageProtocol>)storage;

@end
