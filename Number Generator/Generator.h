//
//  Generator.h
//  Number Generator
//
//  Created by Lance Batson  on 12/30/12.
//
//

#import <Foundation/Foundation.h>

@interface Generator: NSObject

@property (strong, nonatomic) NSNumber *singleNumber;
@property (strong, nonatomic) NSMutableArray *listOfNumbers;

+ (id)sharedGenerator;
- (void)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end;
- (void)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total;
- (void)generateDistinctListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end;

@end
