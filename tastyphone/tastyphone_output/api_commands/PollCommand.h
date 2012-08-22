//
//  
//
//  Created by tastyphone on 22/8/2012.
//


#import "ApiBaseCommand.h"
#import "Poll.h"
@interface PollCommand : ApiBaseCommand {
}

- (void)getPollList;
- (void)getPoll:(NSString*)pk;
- (void)createPoll:(Poll*)aPoll;
- (void)updatePoll:(Poll*)aPoll withId:(NSString*)pk;
- (void)deletePoll:(NSString*)pk;
@end