//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "SigninMap.h"
#import "NSDate+DateFromString.h"

@implementation SigninMap
- (id)mapObject:(id)data {
	Signin *instance = [[Signin alloc] init];
	instance.username = [data objectForKey:@"username"];
	instance.SigninId = [data objectForKey:@"id"];
	instance.email = [data objectForKey:@"email"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
