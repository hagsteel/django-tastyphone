//
//  
//
//  Created by tastyphone on 21/8/2012.
//

#import "ApiError.h"


@implementation ApiError

@synthesize messages;

- (NSString *)getSummary {
	NSMutableString *summary = [[[NSMutableString alloc] init] autorelease];
	for (NSString *k in self.messages.allKeys) {
		for (NSString *msg in [self.messages objectForKey:k]) {
			[summary appendFormat:@"%@\n", msg];
		}
	}
	return summary;
}

- (void)dealloc {
	[messages release];
	[super dealloc];
}

@end
