//
//  Question.m
//
//  Created by tastyphone on 16/8/2012.
//

#import "Question.h"

@implementation Question

@synthesize question;
@synthesize QuestionId;
@synthesize resourceUri;


- (id)init {
    if ((self = [super init])) {
        question = [NSString new];
        QuestionId = [NSString new];
        resourceUri = [NSString new];
    }
    return self;
}

- (void)dealloc {
    [question release];
    [QuestionId release];
    [resourceUri release];
    [super dealloc];
}

@end

