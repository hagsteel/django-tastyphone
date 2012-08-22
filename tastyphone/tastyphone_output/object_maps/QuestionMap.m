//
//  
//
//  Created by tastyphone on 22/8/2012.
//


#import "QuestionMap.h"
#import "NSDate+DateFromString.h"

@interface QuestionMap (Private)
- (id)mapInstance:(id)data;
@end
@implementation QuestionMap
- (id)mapObject:(id)data {
	if ([data objectForKey:@"objects"] != nil) {
		NSMutableArray *items = [[[NSMutableArray alloc] init] autorelease];
		for (NSDictionary *a in [data objectForKey:@"objects"]){
			[items addObject:[self mapInstance:a]];
		}

		return items;
	}

 else {
		return [self mapInstance:data];
	}

}

- (id)mapInstance:(id)data {
	Question *instance = [[[Question alloc] init] autorelease];
	instance.question = [data objectForKey:@"question"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.questionId = [[data objectForKey:@"id"] intValue];
	instance.pollId = [[data objectForKey:@"poll_id"] intValue];
	return instance;
}

@end
