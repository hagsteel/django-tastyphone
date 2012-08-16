//
//  
//
//  Created by tastyphone on 15/8/2012.
//



#import "NSString+DateToString.h"
#import "SigninCommand.h"

@interface SigninCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Signin*)aSignin;
@end

@implementation SigninCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Signin class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Signin*)aSignin {
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"id", @"email", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aSignin.username,
        aSignin.SigninId,
        aSignin.email,
        aSignin.resourceUri,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getSigninList {
    [self.connection makeGetRequest:@"/api/v1/signin/"];
}

- (void)getSignin:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/signin/", pk];
    [self.connection makeGetRequest:uri];
}


@end



