//
//  Signin.m
//
//  Created by tastyphone on 23/8/2012.
//

#import "Signin.h"

@implementation Signin

@synthesize username;
@synthesize password;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        username = [NSString new];
        password = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [username release];
    [password release];
    [resourceUri release];
    [super dealloc];
}

@end

