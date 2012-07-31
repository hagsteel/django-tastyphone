//
//  ObjectMapperFactory.m
//
//  Created by tastyphone on 31/7/2012.
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
                           [Signin new],
                           [Entry new],
                           [User new],
                           [Like new],
                           [Registration new], nil];

		NSArray *keys = [NSArray arrayWithObjects:
                         [Signin class],
                         [Entry class],
                         [User class],
                         [Like class],
                         [Registration class], nil];

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
