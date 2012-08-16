//
//  
//
//  Created by tastyphone on 16/8/2012.
//


#import "QuestionMap.h"
#import "NSDate+DateFromString.h"

@implementation QuestionMap
- (id)mapObject:(id)data {
	Question *instance = [[Question alloc] init];
	instance.question = [data objectForKey:@"question"];
	instance.QuestionId = [data objectForKey:@"id"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
