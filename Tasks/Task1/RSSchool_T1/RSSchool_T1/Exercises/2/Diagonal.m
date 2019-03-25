#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    [array retain];
    int summFirstDiagonal = 0;
    int summSecondDiagonal = 0;
    
    for(int i = 0; i < array.count; i++) {
        NSArray *numbersArray = [array[i] componentsSeparatedByString:@" "];;
        NSNumber *firstDiagonal = numbersArray[i];
        NSNumber *secondDiagonal = numbersArray[(array.count - 1) - i];
        
        if (firstDiagonal, secondDiagonal) {
            summFirstDiagonal += [firstDiagonal integerValue];
            summSecondDiagonal += [secondDiagonal integerValue];
        }
    }
    
    [array release];
    return [NSNumber numberWithInt: abs(summFirstDiagonal - summSecondDiagonal)];
    
}

@end
