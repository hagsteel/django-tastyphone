//
//  Registration.m
//
//  Created by tastyphone on 15/8/2012.
//

#import "Registration.h"

@implementation Registration

@synthesize username;
@synthesize RegistrationId;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        RegistrationId = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [RegistrationId release];
    [resourceUri release];
    [super dealloc];
}

@end

