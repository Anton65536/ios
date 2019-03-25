#import "Pangrams.h"

@interface NSCharacterSet(Extended)
+ (NSCharacterSet *) letters;
@end

@implementation NSCharacterSet(Extended)
+ (NSCharacterSet *) letters {
    return [NSCharacterSet characterSetWithCharactersInString: @"abcdefghijklmnopqrstuvwxyz"];
}
@end

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    [string retain];
    
    NSString *str = [[string stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
    NSCharacterSet *inputSet = [NSCharacterSet characterSetWithCharactersInString:str];
    [string release];
    return [inputSet isEqual:NSCharacterSet.letters];
}

@end
