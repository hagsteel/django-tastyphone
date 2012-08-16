//
//  
//
//  Created by tastyphone on 16/8/2012.
//


#import <Foundation/Foundation.h>
#import "RESTConnection.h"

@protocol ApiCommandDelegate <NSObject>
@optional
- (void)dataReceived:(id)object;
- (void)apiErrorReceived:(ApiError *)error;
- (void)connectionError;
@end

@interface ApiBaseCommand : NSObject <RESTConnectionDelegate> {
	id<ApiCommandDelegate> _delegate;
@protected
	RESTConnection *_connection;
}

@property (nonatomic, retain) RESTConnection *connection;
@property (nonatomic, assign) id<ApiCommandDelegate> delegate;

- (id)initWithTargetClass:(Class)targetClass;

@end
