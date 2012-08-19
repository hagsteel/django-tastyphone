//
//  Poll.m
//
//  Created by tastyphone on 20/8/2012.
//

#import "Poll.h"

@implementation Poll

@synthesize resourceUri;
@synthesize title;
@synthesize pollId;


- (id)init {
    if ((self = [super init])) {
        resourceUri = [NSString new];
        title = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [resourceUri release];
    [title release];
    [super dealloc];
}

@end

