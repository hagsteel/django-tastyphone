//
//  
//
//  Created by tastyphone on 15/8/2012.
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
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"id", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aRegistration.username,
        aRegistration.RegistrationId,
        aRegistration.resourceUri,
        nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)createRegistration:(Registration*)aRegistration {
    [self.connection makePostRequest:[self dictionaryFromModel:aRegistration] withDestination:@"/api/v1/registration/"];
}


@end



