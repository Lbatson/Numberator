//
//  Generator.m
//  Number Generator
//
//  Created by Lance  on 12/30/12.
//
//

#import "Generator.h"

@implementation Generator

@synthesize singleNumber = _singleNumber;
@synthesize listOfNumbers = _listOfNumbers;

- (id)init
{
    self = [super init];
    return self;
}

- (NSNumber *)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end
{
    int range = ([end integerValue]-[start integerValue])+1;
    return [NSNumber numberWithInt:(arc4random()%range + [start integerValue])];
}

- (NSArray *)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total
{
    return _listOfNumbers;
}

@end
