//
//  Choice.h
//
//  Created by tastyphone on 18/8/2012.
//


#import <Foundation/Foundation.h>

@interface Choice : NSObject

@property (nonatomic, retain) NSDate *dateCreated;
@property (nonatomic, retain) NSString *resourceUri;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger ChoiceId;


@end


