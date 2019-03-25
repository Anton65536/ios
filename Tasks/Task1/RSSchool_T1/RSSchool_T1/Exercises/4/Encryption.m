#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    [string retain];
    
    NSString *stringWithoutSpaces = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSUInteger stringLenght = [stringWithoutSpaces length];
    NSNumber *squareOfLenght = @(sqrt(stringLenght));
    int row = floorf(squareOfLenght.doubleValue);
    int column = ceilf(squareOfLenght.doubleValue);
    int amountLastRow = (stringLenght%column) ==0? column: stringLenght%column;
    
    if( row*column<stringLenght){
        row< column ? row++:column++;
    }
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:row];
    for( int i = 0;i < row; i++){
        BOOL endRow = i == row-1;
        NSRange range =NSMakeRange(i*column, endRow?amountLastRow:column);
        NSString *message = [stringWithoutSpaces substringWithRange:range];
        [arr addObject:message];
    }
    [string release];
    return [self encryptedStringWithContentsOfArray:arr];
}
- (NSString *)encryptedStringWithContentsOfArray:(NSArray *)arr{
    [arr retain];
    NSInteger amount = [[arr firstObject] length];
    NSMutableArray *encrypted = [NSMutableArray arrayWithCapacity:amount];
    
    for(int i = 0; i< amount; i++){
        [encrypted addObject:@""];
    }
    for(int i = 0; i <[arr count];i++){
        NSString *string = [arr objectAtIndex:i];
        for(int j = 0;j< [string length];j++){
            NSString *letter = [NSString stringWithFormat:@"%C", [string characterAtIndex:j]];
            NSMutableString *resultOfLetter = [[[encrypted objectAtIndex:j]mutableCopy]autorelease];
            [resultOfLetter appendString:letter];
            [encrypted replaceObjectAtIndex:j withObject:resultOfLetter];
        }
    }
    [arr release];
    return [encrypted componentsJoinedByString:@" "];
}
@end
