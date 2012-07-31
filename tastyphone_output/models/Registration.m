//
//  Registration.m
//
//  Created by tastyphone on 31/7/2012.
//

#import Registration.h

@implementation Registration

@synthesize username
@synthesize id
@synthesize resourceUri


- (id)init {
    if ((self = [super init])) {
        [username new];
        [id new];
        [resourceUri new];
    }
    return self;
}

- (void)dealloc {
    [username release]
    [id release]
    [resourceUri release]
    [super dealloc]
}

@end

