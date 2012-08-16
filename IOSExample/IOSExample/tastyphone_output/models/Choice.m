//
//  Choice.m
//
//  Created by tastyphone on 16/8/2012.
//

#import "Choice.h"

@implementation Choice

@synthesize dateCreated;
@synthesize ChoiceId;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        dateCreated = [NSDate new];
        ChoiceId = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [dateCreated release];
    [ChoiceId release];
    [resourceUri release];
    [super dealloc];
}

@end

