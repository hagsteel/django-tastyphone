//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "ApiBaseCommand.h"
#import "User.h"
@interface UserCommand : ApiBaseCommand {
}

- (void)getUserList;
- (void)getUser:(NSString*)pk;
- (void)updateUser:(User*)aUser withId:(NSString*)pk;
@end