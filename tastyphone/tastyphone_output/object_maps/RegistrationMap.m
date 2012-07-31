//
//  
//
//  Created by tastyphone on 31/7/2012.
//


#import RegistrationMap.h
#import "NSDate+DateFromString.h"

@implementation UserMap
- (id)mapObject:(id)data {
	Registration *instance = [[Registration alloc] init];
	
	instance.username = [data objectForKey:@"username"]
	
	instance.id = [data objectForKey:@"id"]
	
	instance.resourceUri = [data objectForKey:@"resource_uri"]
	

	return instance;
}
@end
