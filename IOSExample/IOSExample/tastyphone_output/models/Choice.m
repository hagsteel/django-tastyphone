//
//  Choice.m
//
//  Created by tastyphone on 19/8/2012.
//

#import "Choice.h"

@implementation Choice

@synthesize description;
@synthesize dateCreated;
@synthesize resourceUri;
@synthesize count;
@synthesize choiceId;
@synthesize questionId;


- (id)init {
    if ((self = [super init])) {
        description = [NSString new];
        dateCreated = [NSDate new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [description release];
    [dateCreated release];
    [resourceUri release];
    [super dealloc];
}

@end

