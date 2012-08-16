//
//  Choice.h
//
//  Created by tastyphone on 16/8/2012.
//


#import <Foundation/Foundation.h>

@interface Choice : NSObject

@property (nonatomic, retain) NSDate *dateCreated;
@property (nonatomic, retain) NSString *ChoiceId;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *resourceUri;
@property (nonatomic, assign) NSInteger count;


@end


