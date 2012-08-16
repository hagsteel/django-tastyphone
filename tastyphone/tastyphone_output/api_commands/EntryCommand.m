//
//  
//
//  Created by tastyphone on 15/8/2012.
//



#import "NSString+DateToString.h"
#import "EntryCommand.h"

@interface EntryCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Entry*)aEntry;
@end

@implementation EntryCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Entry class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Entry*)aEntry {
        NSArray *keys = [NSArray arrayWithObjects:@"content", @"pants", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aEntry.content,
        aEntry.resourceUri,
        [NSString stringWithFormat:@"%@", [NSDate stringFromDate:aEntry.created]],
        [NSString stringWithFormat:@"%d", aEntry.pants],
            [NSString stringWithFormat:@"%d", aEntry.EntryId],
            nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getEntryList {
    [self.connection makeGetRequest:@"/api/v1/entry/"];
}

- (void)getEntry:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/entry/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)createEntry:(Entry*)aEntry {
    [self.connection makePostRequest:[self dictionaryFromModel:aEntry] withDestination:@"/api/v1/entry/"];
}

- (void)updateEntry:(Entry*)aEntry withId:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/entry/", pk];
    [self.connection makePutRequest:[self dictionaryFromModel:aEntry] withDestination:uri];
}

- (void)deleteEntry:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/entry/", pk];
    [self.connection makeDeleteRequest:uri];
}


@end



