//
//  
//
//  Created by tastyphone on 15/8/2012.
//


#import "ApiBaseCommand.h"
#import "Entry.h"
@interface EntryCommand : ApiBaseCommand {
}

- (void)getEntryList;
- (void)getEntry:(NSString*)pk;
- (void)createEntry:(Entry*)aEntry;
- (void)updateEntry:(Entry*)aEntry withId:(NSString*)pk;
- (void)deleteEntry:(NSString*)pk;
@end