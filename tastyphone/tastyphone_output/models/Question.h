//
//  Question.h
//
//  Created by tastyphone on 21/8/2012.
//


#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSString *resourceUri;
@property (nonatomic, assign) NSInteger questionId;
@property (nonatomic, assign) NSInteger pollId;


@end


