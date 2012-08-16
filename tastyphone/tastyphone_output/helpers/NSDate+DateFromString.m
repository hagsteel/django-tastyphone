//
//  
//
//  Created by tastyphone on 15/8/2012.
//

#import "NSDate+DateFromString.h"

@implementation NSDate (NSDate_DateFromString)

+ (NSDate *)dateFromString:(NSString *)dateString {
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z"];
	NSDate *date = [dateFormat dateFromString:dateString];
	return date;
}


@end
