//
//  
//
//  Created by tastyphone on 31/7/2012.
//


#import UserMap.h
#import "NSDate+DateFromString.h"

@implementation UserMap
- (id)mapObject:(id)data {
	User *instance = [[User alloc] init];
	
	instance.username = [data objectForKey:@"username"]
	
	instance.email = [data objectForKey:@"email"]
	
	instance.resourceUri = [data objectForKey:@"resource_uri"]
	

	return instance;
}
@end
