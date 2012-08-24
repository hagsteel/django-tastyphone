//
//  
//
//  Created by tastyphone on 23/8/2012.
//



#import "NSString+DateToString.h"
#import "RegistrationCommand.h"

@interface RegistrationCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Registration*)aRegistration;
@end

@implementation RegistrationCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Registration class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Registration*)aRegistration {
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aRegistration.username,
        aRegistration.password,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)createRegistration:(Registration*)aRegistration {
    [self.connection makePostRequest:[self dictionaryFromModel:aRegistration] withDestination:@"/api/v1/registration/"];
}


@end



