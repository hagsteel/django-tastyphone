//
//  
//
//  Created by tastyphone on 15/8/2012.
//

#import "ApiError.h"

@implementation ApiError

@synthesize message;

- (void)dealloc {
	[message release];
	[super dealloc];
}

@end
