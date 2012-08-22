//
//  
//
//  Created by tastyphone on 22/8/2012.
//



#import "NSString+DateToString.h"
#import "PollCommand.h"

@interface PollCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Poll*)aPoll;
@end

@implementation PollCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Poll class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Poll*)aPoll {
        NSArray *keys = [NSArray arrayWithObjects:@"title", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aPoll.title,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getPollList {
    [self.connection makeGetRequest:@"/api/v1/poll/"];
}

- (void)getPoll:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/poll/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)createPoll:(Poll*)aPoll {
    [self.connection makePostRequest:[self dictionaryFromModel:aPoll] withDestination:@"/api/v1/poll/"];
}

- (void)updatePoll:(Poll*)aPoll withId:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/poll/", pk];
    [self.connection makePutRequest:[self dictionaryFromModel:aPoll] withDestination:uri];
}

- (void)deletePoll:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/poll/", pk];
    [self.connection makeDeleteRequest:uri];
}


@end



