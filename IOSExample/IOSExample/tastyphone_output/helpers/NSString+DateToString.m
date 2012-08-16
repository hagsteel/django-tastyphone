//
//  
//
//  Created by tastyphone on 16/8/2012.
//

#import "NSString+DateToString.h"

@implementation NSDate (NSString_DateToString)

+ (NSString *)stringFromDate:(NSDate *)date {
	static NSDateFormatter* dateFormatter = nil;

	if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];

		NSMutableString *strFormat = [NSMutableString stringWithString:@"yyyyMMdd'T'HH:mm:ss"];

		[dateFormatter setTimeStyle:NSDateFormatterFullStyle];
		[dateFormatter setDateFormat:strFormat];

	}
    return[dateFormatter stringFromDate:date];
}

@end
