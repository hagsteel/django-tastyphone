//
//  
//
//  Created by tastyphone on 15/8/2012.
//



#import "NSString+DateToString.h"
#import "LikeCommand.h"

@interface LikeCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Like*)aLike;
@end

@implementation LikeCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Like class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Like*)aLike {
        NSArray *keys = [NSArray arrayWithObjects:@"created", nil];
        NSArray *values = [NSArray arrayWithObjects:
        [NSString stringWithFormat:@"%@", [NSDate stringFromDate:aLike.created]],
        aLike.resourceUri,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getLikeList {
    [self.connection makeGetRequest:@"/api/v1/like/"];
}

- (void)getLike:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/like/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)createLike:(Like*)aLike {
    [self.connection makePostRequest:[self dictionaryFromModel:aLike] withDestination:@"/api/v1/like/"];
}

- (void)deleteLike:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/like/", pk];
    [self.connection makeDeleteRequest:uri];
}


@end



