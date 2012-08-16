//
//  Entry.m
//
//  Created by tastyphone on 15/8/2012.
//

#import "Entry.h"

@implementation Entry

@synthesize content;
@synthesize resourceUri;
@synthesize created;
@synthesize pants;
@synthesize EntryId;


- (id)init {
    if ((self = [super init])) {
        content = [NSString new];
        resourceUri = [NSString new];
        created = [NSDate new];
    }
    return self;
}

- (void)dealloc {
    [content release];
    [resourceUri release];
    [created release];
    [super dealloc];
}

@end

