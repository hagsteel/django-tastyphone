//
//  ObjectMapperFactory.m
//
//  Created by tastyphone on 16/8/2012.
//

#import "ObjectMapperFactory.h"


//////////////////////////////////
// Shared Instance

static ObjectMapperFactory* sharedObjectMapper = nil;

///////////////////////////////////

@implementation ObjectMapperFactory

- (id)init {
	if ((self = [super init])) {
		NSArray *values = [NSArray arrayWithObjects:
                           [PollMap new],
                           [QuestionMap new],
                           [ChoiceMap new], nil];

		NSArray *keys = [NSArray arrayWithObjects:
                         [Poll class],
                         [Question class],
                         [Choice class], nil];

		_objectMaps = [NSDictionary dictionaryWithObjects:values forKeys:keys];
	}
	return self;
}

+ (ObjectMapperFactory*)sharedInstance {
	if (sharedObjectMapper == nil)
		sharedObjectMapper = [[ObjectMapperFactory alloc] init];

	return sharedObjectMapper;
}

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass {
	for (Class c in [_objectMaps allKeys]) {
		if (c == theClass)
			return (id<ObjectMapProtocol>)[_objectMaps objectForKey:c];
	}

	return nil;
}
@end
