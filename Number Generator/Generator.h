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
@property (nonatomic,strong) NSArray *listOfNumbers;

+ (id)sharedGenerator;
- (NSNumber *)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end;
- (NSArray *)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total;

@end
