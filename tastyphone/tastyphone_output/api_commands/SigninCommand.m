//
//  
//
//  Created by tastyphone on 23/8/2012.
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
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aSignin.username,
        aSignin.password,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}




- (void)getSigninByUsername:(NSString*)username Password:(NSString*)password {
    NSString *uri = [NSString stringWithFormat:@"/api/v1/signin/?username=%@&password=%@", username, password];
    [self.connection makeGetRequest:uri];
}


@end



