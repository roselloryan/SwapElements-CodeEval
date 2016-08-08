//
//  main.m
//  SwapElements


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"1 2 3 4 5 6 7 8 9 10 : 0-1, 1-3";
        
        NSArray *sepArray = [line componentsSeparatedByString:@" : "];
        
        NSMutableArray *numbersMutArray = [[[sepArray objectAtIndex:0] componentsSeparatedByString:@" "] mutableCopy];
        
        NSArray *indexesToSwapArray = [[sepArray objectAtIndex:1] componentsSeparatedByString:@","];
        
        
        NSUInteger i = 0;
        for (i = 0; i < indexesToSwapArray.count; i++) {
            NSString *indexesString =  [indexesToSwapArray objectAtIndex: i];
            
            NSArray *indexesArray = [indexesString componentsSeparatedByString:@"-"];
    
//            NSLog(@"first index: %@\nsecond index: %@", indexesArray[0], indexesArray[1]);
            
            NSUInteger firstIndex = [[indexesArray objectAtIndex: 0] integerValue];
            NSUInteger secondIndex = [[indexesArray objectAtIndex: 1] integerValue];
            
            NSString *firstObject = [numbersMutArray objectAtIndex: firstIndex];
            NSString *secondObject = [numbersMutArray objectAtIndex: secondIndex];
            
            [numbersMutArray replaceObjectAtIndex: firstIndex withObject: secondObject];
            [numbersMutArray replaceObjectAtIndex: secondIndex withObject: firstObject];
        }
//        NSLog(@"%@", numbersMutArray);
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        NSUInteger j = 0;
        for (j = 0; j < numbersMutArray.count; j ++) {
            if (j == numbersMutArray.count - 1) {
                [solutionString appendString: [numbersMutArray objectAtIndex: j]];
            }
            else {
                [solutionString appendString: [NSString stringWithFormat:@"%@ ", [numbersMutArray objectAtIndex: j]]];
            }
        }
        
        NSLog(@"%@", solutionString);
        
    }
    return 0;
}
