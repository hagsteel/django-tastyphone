//
//  ObjectMapperFactory.h
//
//  Created by tastyphone on 16/8/2012.
//

#import <Foundation/Foundation.h>
#import "ObjectMapProtocol.h"

#import "PollMap.h"
#import "QuestionMap.h"
#import "ChoiceMap.h"

@interface ObjectMapperFactory : NSObject {
	NSDictionary *_objectMaps;
}

+ (ObjectMapperFactory*)sharedInstance;

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass;
@end
