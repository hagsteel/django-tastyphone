//
//  
//
//  Created by tastyphone on 20/8/2012.
//


#import "ApiBaseCommand.h"
#import "Choice.h"
@interface ChoiceCommand : ApiBaseCommand {
}

- (void)getChoiceList;
- (void)getChoice:(NSString*)pk;
- (void)getChoiceByQuestion:(NSString*)question;
- (void)createChoice:(Choice*)aChoice;
- (void)updateChoice:(Choice*)aChoice withId:(NSString*)pk;
- (void)deleteChoice:(NSString*)pk;
@end