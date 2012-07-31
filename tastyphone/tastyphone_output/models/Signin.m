//
//  Signin.m
//
//  Created by tastyphone on 31/7/2012.
//

#import Signin.h

@implementation Signin

@synthesize username
@synthesize resourceUri
@synthesize email
@synthesize id


- (id)init {
    if ((self = [super init])) {
        [username new];
        [resourceUri new];
        [email new];
        [id new];
    }
    return self;
}

- (void)dealloc {
    [username release]
    [resourceUri release]
    [email release]
    [id release]
    [super dealloc]
}

@end

