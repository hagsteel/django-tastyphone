//
//  
//
//  Created by tastyphone on 19/8/2012.
//

#import "ApiBaseCommand.h"

@implementation ApiBaseCommand

@synthesize connection=_connection;
@synthesize delegate=_delegate;

- (id)initWithTargetClass:(Class)targetClass
{
	self = [super init];
	if (self)
	{
		self.connection = [[RESTConnection alloc] initWithTargetClass:targetClass];
		self.connection.delegate = self;
	}
	return self;
}

- (void)dataReceived:(id)object {
	if ([self.delegate respondsToSelector:@selector(dataReceived:)]) {
		[self.delegate dataReceived:object];
	}
}

- (void)apiErrorReceived:(ApiError *)error {
	if ([self.delegate respondsToSelector:@selector(apiErrorReceived:)]) {
		[self.delegate apiErrorReceived:error];
	}
}

- (void)connectionError {
	if ([self.delegate respondsToSelector:@selector(connectionError)]) {
		[self.delegate connectionError];
	}
}

@end

