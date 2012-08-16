//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "RegistrationMap.h"
#import "NSDate+DateFromString.h"

@implementation RegistrationMap
- (id)mapObject:(id)data {
	Registration *instance = [[Registration alloc] init];
	instance.username = [data objectForKey:@"username"];
	instance.RegistrationId = [data objectForKey:@"id"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
