//
//  Like.m
//
//  Created by tastyphone on 15/8/2012.
//

#import "Like.h"

@implementation Like

@synthesize created;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        created = [NSDate new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [created release];
    [resourceUri release];
    [super dealloc];
}

@end

