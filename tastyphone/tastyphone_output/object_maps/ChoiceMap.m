//
//  
//
//  Created by tastyphone on 16/8/2012.
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
	instance.dateCreated = [NSDate dateFromString:[data objectForKey:@"date_created"]];
	instance.ChoiceId = [data objectForKey:@"id"];
	instance.description = [data objectForKey:@"description"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
