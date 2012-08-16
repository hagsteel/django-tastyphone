//
//  Signin.m
//
//  Created by tastyphone on 15/8/2012.
//

#import "Signin.h"

@implementation Signin

@synthesize username;
@synthesize SigninId;
@synthesize email;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        SigninId = [NSString new];
        email = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [SigninId release];
    [email release];
    [resourceUri release];
    [super dealloc];
}

@end

