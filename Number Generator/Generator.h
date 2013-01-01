//
//  Generator.h
//  Number Generator
//
//  Created by Lance  on 12/30/12.
//
//

#import <Foundation/Foundation.h>

@interface Generator: NSObject

@property (nonatomic,strong) NSNumber *singleNumber;
@property (nonatomic,strong) NSMutableArray *listOfNumbers;

+ (id)sharedGenerator;
- (NSNumber *)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end;
- (NSMutableArray *)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total;

@end
