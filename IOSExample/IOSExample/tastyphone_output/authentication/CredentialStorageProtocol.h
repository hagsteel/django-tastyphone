//
//  CredentialStorageProtocol.h
//  IOSExample
//
//  Created by Jonas Hagstedt on 20/08/2012.
//  Copyright (c) 2012 Jonas Hagstedt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CredentialStorageProtocol <NSObject>
- (void)saveCredentials:(NSDictionary*)credentials;
- (NSDictionary*)getCredentials;
- (void)removeCredentials;
@end
