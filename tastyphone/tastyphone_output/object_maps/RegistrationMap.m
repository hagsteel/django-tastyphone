//
//  
//
//  Created by tastyphone on 21/8/2012.
//


#import "RegistrationMap.h"
#import "NSDate+DateFromString.h"

@interface RegistrationMap (Private)
- (id)mapInstance:(id)data;
@end
@implementation RegistrationMap
- (id)mapObject:(id)data {
	if ([data objectForKey:@"objects"] != nil) {
		NSMutableArray *items = [[[NSMutableArray alloc] init] autorelease];
		for (NSDictionary *a in [data objectForKey:@"objects"]){
			[items addObject:[self mapInstance:a]];
		}

		return items;
	}

 else {
		return [self mapInstance:data];
	}

}

- (id)mapInstance:(id)data {
	Registration *instance = [[[Registration alloc] init] autorelease];
	instance.username = [data objectForKey:@"username"];
	instance.apiKey = [data objectForKey:@"api_key"];
	instance.password = [data objectForKey:@"password"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	instance.registrationId = [[data objectForKey:@"id"] intValue];
	return instance;
}

@end
