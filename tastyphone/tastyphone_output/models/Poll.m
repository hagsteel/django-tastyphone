//
//  Poll.m
//
//  Created by tastyphone on 16/8/2012.
//

#import "Poll.h"

@implementation Poll

@synthesize resourceUri;
@synthesize PollId;
@synthesize title;


- (id)init {
    if ((self = [super init])) {
        resourceUri = [NSString new];
        PollId = [NSString new];
        title = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [resourceUri release];
    [PollId release];
    [title release];
    [super dealloc];
}

@end

