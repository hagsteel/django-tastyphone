//
//  Entry.m
//
//  Created by tastyphone on 31/7/2012.
//

#import Entry.h

@implementation Entry

@synthesize created
@synthesize author
@synthesize content
@synthesize likes
@synthesize resourceUri
@synthesize id
@synthesize pants


- (id)init {
    if ((self = [super init])) {
        [created new];
        [author new];
        [content new];
        [likes new];
        [resourceUri new];
        [id new];
    }
    return self;
}

- (void)dealloc {
    [created release]
    [author release]
    [content release]
    [likes release]
    [resourceUri release]
    [id release]
    [super dealloc]
}

@end

