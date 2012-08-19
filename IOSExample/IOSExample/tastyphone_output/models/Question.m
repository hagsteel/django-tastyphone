//
//  Question.m
//
//  Created by tastyphone on 19/8/2012.
//

#import "Question.h"

@implementation Question

@synthesize question;
@synthesize resourceUri;
@synthesize QuestionId;


- (id)init {
    if ((self = [super init])) {
        question = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [question release];
    [resourceUri release];
    [super dealloc];
}

@end

