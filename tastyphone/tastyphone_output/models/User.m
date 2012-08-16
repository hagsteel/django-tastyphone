//
//  User.m
//
//  Created by tastyphone on 15/8/2012.
//

#import "User.h"

@implementation User

@synthesize username;
@synthesize email;
@synthesize resourceUri;


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

