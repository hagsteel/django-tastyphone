//
//  Signin.m
//
//  Created by tastyphone on 21/8/2012.
//

#import "Signin.h"

@implementation Signin

@synthesize username;
@synthesize signinId;
@synthesize email;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        signinId = [NSString new];
        email = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [signinId release];
    [email release];
    [resourceUri release];
    [super dealloc];
}

@end

