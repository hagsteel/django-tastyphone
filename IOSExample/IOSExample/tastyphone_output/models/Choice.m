//
//  Choice.m
//
//  Created by tastyphone on 18/8/2012.
//

#import "Choice.h"

@implementation Choice

@synthesize dateCreated;
@synthesize resourceUri;
@synthesize description;
@synthesize count;
@synthesize ChoiceId;


- (id)init {
    if ((self = [super init])) {
        dateCreated = [NSDate new];
        resourceUri = [NSString new];
        description = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [dateCreated release];
    [resourceUri release];
    [description release];
    [super dealloc];
}

@end

