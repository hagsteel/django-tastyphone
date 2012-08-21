//
//  
//
//  Created by tastyphone on 21/8/2012.
//


#import "ApiBaseCommand.h"
#import "Signin.h"
@interface SigninCommand : ApiBaseCommand {
}

- (void)getSigninList;
- (void)getSignin:(NSString*)pk;
- (void)getSigninByUsername:(NSString*)username;
- (void)getSigninByPassword:(NSString*)password;
@end