//
//  
//
//  Created by tastyphone on 31/7/2012.
//


#import LikeMap.h
#import "NSDate+DateFromString.h"

@implementation UserMap
- (id)mapObject:(id)data {
	Like *instance = [[Like alloc] init];
	
	instance.entry = -
	
	instance.resourceUri = [data objectForKey:@"resource_uri"]
	
	instance.created = [NSDate dateFromString:[data objectForKey:@"created"]]
	

	return instance;
}
@end
