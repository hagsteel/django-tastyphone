//
//  
//
//  Created by tastyphone on 15/8/2012.
//

#import <Foundation/Foundation.h>
#import "ApiError.h"
#import "ObjectMapperFactory.h"

// DEV
#define kHostname @"192.168.1.81"
#define kRootUrl @"http://192.168.1.81:8000/api/v1"
#define kVersion @"dev 0.0.1"
//#define kIsDevVersion

@protocol RESTConnectionDelegate <NSObject>
- (void)dataReceived:(id)object;
- (void)apiErrorReceived:(ApiError *)error;
- (void)connectionError;
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
