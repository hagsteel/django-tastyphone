//
//  User.m
//
//  Created by tastyphone on 31/7/2012.
//

#import User.h

@implementation User

@synthesize username
@synthesize email
@synthesize resourceUri


- (id)init {
    if ((self = [super init])) {
        [username new];
        [email new];
        [resourceUri new];
    }
    return self;
}

- (void)dealloc {
    [username release]
    [email release]
    [resourceUri release]
    [super dealloc]
}

@end

