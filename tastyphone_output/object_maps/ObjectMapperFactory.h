//
//  ObjectMapperFactory.h
//
//  Created by tastyphone on 31/7/2012.
//

#import <Foundation/Foundation.h>

#import "Signin.h"
#import "Entry.h"
#import "User.h"
#import "Like.h"
#import "Registration.h"

@interface ObjectMapperFactory : NSObject {
	NSDictionary *_objectMaps;
}

+ (ObjectMapperFactory*)sharedInstance;

- (id<ObjectMapProtocol>)getMapperForClass:(Class)theClass;
@end
