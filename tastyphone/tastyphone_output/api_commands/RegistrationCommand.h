//
//  
//
//  Created by tastyphone on 21/8/2012.
//


#import "ApiBaseCommand.h"
#import "Registration.h"
@interface RegistrationCommand : ApiBaseCommand {
}

- (void)createRegistration:(Registration*)aRegistration;
@end