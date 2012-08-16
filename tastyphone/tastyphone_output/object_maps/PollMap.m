//
//  
//
//  Created by tastyphone on 16/8/2012.
//


#import "PollMap.h"
#import "NSDate+DateFromString.h"

@implementation PollMap
- (id)mapObject:(id)data {
	Poll *instance = [[Poll alloc] init];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.PollId = [data objectForKey:@"id"];
	instance.title = [data objectForKey:@"title"];
	return instance;
}

@end
