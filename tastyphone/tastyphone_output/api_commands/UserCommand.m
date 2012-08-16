//
//  
//
//  Created by tastyphone on 15/8/2012.
//



#import "NSString+DateToString.h"
#import "UserCommand.h"

@interface UserCommand (Private)
- (NSDictionary*)dictionaryFromModel:(User*)aUser;
@end

@implementation UserCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[User class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(User*)aUser {
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"email", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aUser.username,
        aUser.email,
        aUser.resourceUri,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getUserList {
    [self.connection makeGetRequest:@"/api/v1/user/"];
}

- (void)getUser:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/user/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)updateUser:(User*)aUser withId:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/user/", pk];
    [self.connection makePutRequest:[self dictionaryFromModel:aUser] withDestination:uri];
}


@end



