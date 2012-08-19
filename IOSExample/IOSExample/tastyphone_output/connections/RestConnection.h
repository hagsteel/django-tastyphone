//
//  
//
//  Created by tastyphone on 19/8/2012.
//

#import <Foundation/Foundation.h>
#import "ApiError.h"
#import "ObjectMapperFactory.h"

#define kHostname @"127.0.0.1"
#define kApiRootUrl @"http://127.0.0.1:8000"

@protocol RESTConnectionDelegate <NSObject>
- (void)dataReceived:(id)object;
- (void)apiErrorReceived:(ApiError *)error;
- (void)connectionError;
- (void)objectCreated;
- (void)objectUpdated;
@end

@interface RESTConnection : NSObject <NSURLConnectionDataDelegate> {
	Class _targetClass;
@private
	NSURLConnection *_urlConnection;
	NSMutableData *_receivedData;
	NSInteger _statuscode;
}

@property (nonatomic, assign) id<RESTConnectionDelegate> delegate;

- (id)initWithTargetClass:(Class)theClass;
- (void)makeGetRequest:(NSString *)destination;
- (void)makePostRequest:(NSDictionary *)formData withDestination:(NSString *)destination;
- (void)makePutRequest:(NSDictionary *)formData withDestination:(NSString *)destination;
- (void)makeDeleteRequest:(NSString *)destination;

@end