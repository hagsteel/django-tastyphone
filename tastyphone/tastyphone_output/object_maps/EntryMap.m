//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "EntryMap.h"
#import "NSDate+DateFromString.h"

@implementation EntryMap
- (id)mapObject:(id)data {
	Entry *instance = [[Entry alloc] init];
	instance.content = [data objectForKey:@"content"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.created = [NSDate dateFromString:[data objectForKey:@"created"]];
	return instance;
}

@end
