//
//  Like.m
//
//  Created by tastyphone on 31/7/2012.
//

#import Like.h

@implementation Like

@synthesize entry
@synthesize resourceUri
@synthesize created


- (id)init {
    if ((self = [super init])) {
        [entry new];
        [resourceUri new];
        [created new];
    }
    return self;
}

- (void)dealloc {
    [entry release]
    [resourceUri release]
    [created release]
    [super dealloc]
}

@end

