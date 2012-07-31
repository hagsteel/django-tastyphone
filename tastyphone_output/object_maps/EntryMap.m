//
//  
//
//  Created by tastyphone on 31/7/2012.
//


#import EntryMap.h
#import "NSDate+DateFromString.h"

@implementation UserMap
- (id)mapObject:(id)data {
	Entry *instance = [[Entry alloc] init];
	
	instance.created = [NSDate dateFromString:[data objectForKey:@"created"]]
	
	instance.author = -
	
	instance.content = [data objectForKey:@"content"]
	
	instance.likes = -
	
	instance.resourceUri = [data objectForKey:@"resource_uri"]
	
	instance.id = [data objectForKey:@"id"]
	

	return instance;
}
@end
