//
//  Choice.m
//
//  Created by tastyphone on 16/8/2012.
//

#import "Choice.h"

@implementation Choice

@synthesize dateCreated;
@synthesize ChoiceId;
@synthesize description;
@synthesize resourceUri;
@synthesize count;


- (id)init {
    if ((self = [super init])) {
        dateCreated = [NSDate new];
        ChoiceId = [NSString new];
        description = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [dateCreated release];
    [ChoiceId release];
    [description release];
    [resourceUri release];
    [super dealloc];
}

@end

