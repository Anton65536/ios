#import "SummArray.h"


@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    
    [array retain];
    
    int res = 0;
    
    for(int i = 0; i < array.count; i++)
    {
        NSNumber *value = array[i];
        
        if (value)
        {
            res += [value integerValue];
        }
    }
    
    [array release];
    return @(res);
}

@end
