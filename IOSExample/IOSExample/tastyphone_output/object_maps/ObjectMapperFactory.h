//
//  ObjectMapperFactory.h
//
//  Created by tastyphone on 16/8/2012.
//

#import <Foundation/Foundation.h>
#import "ObjectMapProtocol.h"

#import "Poll.h"
#import "Question.h"
#import "Choice.h"

@interface ObjectMapperFactory : NSObject {
	NSDictionary *_objectMaps;
}

+ (ObjectMapperFactory*)sharedInstance;

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass;
@end
