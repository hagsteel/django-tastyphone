//
//  
//
//  Created by tastyphone on 21/8/2012.
//



#import "NSString+DateToString.h"
#import "ChoiceCommand.h"

@interface ChoiceCommand (Private)
- (NSDictionary*)dictionaryFromModel:(Choice*)aChoice;
@end

@implementation ChoiceCommand

@synthesize delegate;

- (id)init {
    if ((self = [super initWithTargetClass:[Choice class]])) {
    }

    return self;
}

- (NSDictionary*)dictionaryFromModel:(Choice*)aChoice {
        NSArray *keys = [NSArray arrayWithObjects:@"description", @"count", @"question_id", nil];
        NSArray *values = [NSArray arrayWithObjects:
        aChoice.description,
        [NSString stringWithFormat:@"%d", aChoice.count],
            [NSString stringWithFormat:@"%d", aChoice.questionId],
            nil];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        return dict;
}

- (void)getChoiceList {
    [self.connection makeGetRequest:@"/api/v1/choice/"];
}

- (void)getChoice:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/choice/", pk];
    [self.connection makeGetRequest:uri];
}

- (void)getChoiceByQuestion:(NSString*)question {
    NSString *uri = [NSString stringWithFormat:@"%@?question=%@", @"/api/v1/choice/", question];
    [self.connection makeGetRequest:uri];
}

- (void)createChoice:(Choice*)aChoice {
    [self.connection makePostRequest:[self dictionaryFromModel:aChoice] withDestination:@"/api/v1/choice/"];
}

- (void)updateChoice:(Choice*)aChoice withId:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/choice/", pk];
    [self.connection makePutRequest:[self dictionaryFromModel:aChoice] withDestination:uri];
}

- (void)deleteChoice:(NSString*)pk {
    NSString *uri = [NSString stringWithFormat:@"%@%@/", @"/api/v1/choice/", pk];
    [self.connection makeDeleteRequest:uri];
}


@end



