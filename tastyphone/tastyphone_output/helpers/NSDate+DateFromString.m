//
//  
//
//  Created by tastyphone on 20/8/2012.
//

#import "NSDate+DateFromString.h"

@implementation NSDate (NSDate_DateFromString)

+ (NSDate *)dateFromString:(NSString *)dateString {
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"];

	NSDate *theDate = nil;
	NSError *error = nil;
	[dateFormat getObjectValue:&theDate forString:dateString range:nil error:&error];
	[dateFormat release];
	return theDate;
}

@end
