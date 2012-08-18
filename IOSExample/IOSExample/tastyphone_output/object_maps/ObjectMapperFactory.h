//
//  ObjectMapperFactory.h
//
//  Created by tastyphone on 18/8/2012.
//

#import <Foundation/Foundation.h>
#import "ObjectMapProtocol.h"

#import "PollMap.h"
#import "QuestionMap.h"
#import "ChoiceMap.h"

@interface ObjectMapperFactory : NSObject

@property (nonatomic, retain) NSDictionary *objectMaps;
+ (ObjectMapperFactory*)sharedInstance;

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass;
@end
