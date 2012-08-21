//
//  Registration.m
//
//  Created by tastyphone on 21/8/2012.
//

#import "Registration.h"

@implementation Registration

@synthesize username;
@synthesize apiKey;
@synthesize password;
@synthesize resourceUri;
@synthesize registrationId;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        apiKey = [NSString new];
        password = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [apiKey release];
    [password release];
    [resourceUri release];
    [super dealloc];
}

@end

