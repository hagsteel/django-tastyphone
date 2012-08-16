//
//  Entry.h
//
//  Created by tastyphone on 15/8/2012.
//


#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *resourceUri;
@property (nonatomic, retain) NSDate *created;
@property (nonatomic, assign) NSInteger pants;
@property (nonatomic, assign) NSInteger EntryId;


@end


