//
//  Signin.m
//
//  Created by tastyphone on 21/8/2012.
//

#import "Signin.h"

@implementation Signin

@synthesize username;
@synthesize email;
@synthesize resourceUri;
@synthesize signinId;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        email = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [email release];
    [resourceUri release];
    [super dealloc];
}

@end

