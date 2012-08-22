//
//  
//
//  Created by tastyphone on 22/8/2012.
//

#import <Foundation/Foundation.h>

@protocol CredentialStorageProtocol <NSObject>
- (void)saveCredentials:(NSDictionary*)credentials;
- (NSDictionary*)getCredentials;
- (void)removeCredentials;
@end
