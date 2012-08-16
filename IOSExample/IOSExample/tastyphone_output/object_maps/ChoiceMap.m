//
//  
//
//  Created by tastyphone on 16/8/2012.
//


#import "ChoiceMap.h"
#import "NSDate+DateFromString.h"

@implementation ChoiceMap
- (id)mapObject:(id)data {
	Choice *instance = [[Choice alloc] init];
	instance.dateCreated = [NSDate dateFromString:[data objectForKey:@"date_created"]];
	instance.ChoiceId = [data objectForKey:@"id"];
	instance.resourceUri = [data objectForKey:@"resource_uri"];
	return instance;
}

@end
