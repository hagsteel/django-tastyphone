//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "ApiBaseCommand.h"
#import "Signin.h"
@interface SigninCommand : ApiBaseCommand {
}

- (void)getSigninList;
- (void)getSignin:(NSString*)pk;
@end