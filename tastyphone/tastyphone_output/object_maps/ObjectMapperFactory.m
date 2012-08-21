//
//  ObjectMapperFactory.m
//
//  Created by tastyphone on 21/8/2012.
//

#import "ObjectMapperFactory.h"


//////////////////////////////////
// Shared Instance

static ObjectMapperFactory* sharedObjectMapper = nil;

///////////////////////////////////

@implementation ObjectMapperFactory

@synthesize objectMaps;

- (id)init {
	if ((self = [super init])) {
		NSArray *values = [NSArray arrayWithObjects:
                           [[[RegistrationMap alloc] init] autorelease],
                           [[[SigninMap alloc] init] autorelease],
                           [[[PollMap alloc] init] autorelease],
                           [[[QuestionMap alloc] init] autorelease],
                           [[[ChoiceMap alloc] init] autorelease], nil];

		NSArray *keys = [NSArray arrayWithObjects:
                         [Registration class],
                         [Signin class],
                         [Poll class],
                         [Question class],
                         [Choice class], nil];

		self.objectMaps = [NSDictionary dictionaryWithObjects:values forKeys:keys];
	}
	return self;
}

+ (ObjectMapperFactory*)sharedInstance {
	if (sharedObjectMapper == nil)
		sharedObjectMapper = [[ObjectMapperFactory alloc] init];

	return sharedObjectMapper;
}

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass {
	for (Class c in [self.objectMaps allKeys]) {
		if (c == theClass)
			return (id<ObjectMapProtocol>)[self.objectMaps objectForKey:c];
	}

	return nil;
}
@end
