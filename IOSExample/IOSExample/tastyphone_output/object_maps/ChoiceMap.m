//
//  
//
//  Created by tastyphone on 19/8/2012.
//


#import "ChoiceMap.h"
#import "NSDate+DateFromString.h"

@interface ChoiceMap (Private)
- (id)mapInstance:(id)data;
@end
@implementation ChoiceMap
- (id)mapObject:(id)data {
	if ([data objectForKey:@"objects"] != nil) {
		NSMutableArray *items = [NSMutableArray new];
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
	Choice *instance = [[Choice alloc] init];
	instance.description = [data objectForKey:@"description"];
	instance.dateCreated = [NSDate dateFromString:[data objectForKey:@"date_created"]];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.count = [[data objectForKey:@"count"] intValue];
	instance.ChoiceId = [[data objectForKey:@"id"] intValue];
	instance.questionId = [[data objectForKey:@"question_id"] intValue];
	return instance;
}

@end
