//
//  Entry.h
//
//  Created by tastyphone on 31/7/2012.
//


#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, retain) NSDate *created
@property (nonatomic, retain) NSObject *author
@property (nonatomic, retain) NSString *content
@property (nonatomic, retain) NSObject *likes
@property (nonatomic, retain) NSString *resourceUri
@property (nonatomic, retain) NSString *id
@property (nonatomic, assign) NSInteger pants


@end


