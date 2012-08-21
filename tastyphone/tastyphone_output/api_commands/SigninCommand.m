//
//  
//
//  Created by tastyphone on 21/8/2012.
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
        aSignin.signinId,
        aSignin.email,
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

- (void)getSigninByUsername:(NSString*)username {
    NSString *uri = [NSString stringWithFormat:@"%@?username=%@", @"/api/v1/signin/", username];
    [self.connection makeGetRequest:uri];
}

- (void)getSigninByPassword:(NSString*)password {
    NSString *uri = [NSString stringWithFormat:@"%@?password=%@", @"/api/v1/signin/", password];
    [self.connection makeGetRequest:uri];
}


@end



