//
//  
//
//  Created by tastyphone on 23/8/2012.
//


#import "PollMap.h"
#import "NSDate+DateFromString.h"

@interface PollMap (Private)
- (id)mapInstance:(id)data;
@end
@implementation PollMap
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
	Poll *instance = [[[Poll alloc] init] autorelease];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.title = [data objectForKey:@"title"];
	instance.pollId = [[data objectForKey:@"id"] intValue];
	return instance;
}

@end