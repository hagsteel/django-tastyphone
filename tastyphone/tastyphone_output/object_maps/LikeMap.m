//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "LikeMap.h"
#import "NSDate+DateFromString.h"

@implementation LikeMap
- (id)mapObject:(id)data {
	Like *instance = [[Like alloc] init];
	instance.created = [NSDate dateFromString:[data objectForKey:@"created"]];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
