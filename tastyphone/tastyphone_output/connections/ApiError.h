//
//  
//
//  Created by tastyphone on 22/8/2012.
//

#import <Foundation/Foundation.h>

@interface ApiError : NSObject

@property (nonatomic, retain) NSDictionary *messages;
- (NSString *)getSummary;
@end
