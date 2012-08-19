//
//  Choice.h
//
//  Created by tastyphone on 20/8/2012.
//


#import <Foundation/Foundation.h>

@interface Choice : NSObject

@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSDate *dateCreated;
@property (nonatomic, retain) NSString *resourceUri;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger choiceId;
@property (nonatomic, assign) NSInteger questionId;


@end


