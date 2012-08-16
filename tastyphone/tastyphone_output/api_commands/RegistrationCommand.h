//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "ApiBaseCommand.h"
#import "Registration.h"
@interface RegistrationCommand : ApiBaseCommand {
}

- (void)createRegistration:(Registration*)aRegistration;
@end