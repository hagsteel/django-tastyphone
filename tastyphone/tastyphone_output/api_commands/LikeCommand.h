//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "ApiBaseCommand.h"
#import "Like.h"
@interface LikeCommand : ApiBaseCommand {
}

- (void)getLikeList;
- (void)getLike:(NSString*)pk;
- (void)createLike:(Like*)aLike;
- (void)deleteLike:(NSString*)pk;
@end