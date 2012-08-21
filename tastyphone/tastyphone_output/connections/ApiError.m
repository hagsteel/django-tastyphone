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
		if ([[self.messages objectForKey:k] isKindOfClass:[NSArray class]]) {
			for (NSString *msg in [self.messages objectForKey:k]) {
				[summary appendFormat:@"%@\n", msg];
			}
		} else {
			[summary appendFormat:@"%@\n", [self.messages objectForKey:k]];
		}
	}
	return summary;
}

- (void)dealloc {
	[messages release];
	[super dealloc];
}

@end
