//
//  
//
//  Created by tastyphone on 31/7/2012.
//


#import SigninMap.h
#import "NSDate+DateFromString.h"

@implementation UserMap
- (id)mapObject:(id)data {
	Signin *instance = [[Signin alloc] init];
	
	instance.username = [data objectForKey:@"username"]
	
	instance.resourceUri = [data objectForKey:@"resource_uri"]
	
	instance.email = [data objectForKey:@"email"]
	
	instance.id = [data objectForKey:@"id"]
	

	return instance;
}
@end
