//
//  Generator.m
//  Number Generator
//
//  Created by Lance Batson  on 12/30/12.
//
//

#import "Generator.h"

@implementation Generator

+ (id)sharedGenerator {
    static Generator *generator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        generator = [[self alloc] init];
    });
    return generator;
}

- (id)init
{
    if (self = [super init]){
    }
    return self;
}

- (void)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end
{
    // Returns single random number
    int range = ([end integerValue]-[start integerValue]) + 1;
    // Old method using arc4random
    // _singleNumber = [NSNumber numberWithInt:(arc4random() % range + [start integerValue])];
    if ([start integerValue] == 0) {
        _singleNumber = [NSNumber numberWithInt:(arc4random_uniform(end.integerValue + 1) % range + [start integerValue])];
    } else {
        _singleNumber = [NSNumber numberWithInt:(arc4random_uniform(end.integerValue) % range + [start integerValue])];    
    }
}

- (void)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total
{
    // Returns amount of numbers = total in range provided as an array
    if (_listOfNumbers.count > 0) {
        [_listOfNumbers removeAllObjects];
    } else {
        _listOfNumbers = [NSMutableArray array];
    }
    for (int i = 0; i < total; i++) {
        [self generateSingleNumberWithRangeStarting:start andEnding:end];
        [_listOfNumbers addObject:_singleNumber];
    }
}

- (void)generateDistinctListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end
{
    // Returns distinct list of all numbers in given range in random order as an array
    if (_listOfNumbers.count > 0) {
        [_listOfNumbers removeAllObjects];
    } else {
        _listOfNumbers = [NSMutableArray array];
    }
    
    // Create array of numbers between given range
    NSInteger total = [end integerValue] - [start integerValue] + 1;
    NSInteger incremental = [start integerValue];
    for (int i = 0; i < total; i++) {
        [_listOfNumbers addObject:[NSNumber numberWithFloat:incremental]];
        incremental++;
    }
    
    // Select a random element between i and end of array to swap with.
    NSInteger max = _listOfNumbers.count;
    for (NSInteger i = 0; i < max; ++i) {
        NSInteger total = max - i;
        NSInteger random = (arc4random_uniform(end.integerValue) % total) + i;
        [_listOfNumbers exchangeObjectAtIndex:i withObjectAtIndex:random];
    }
}

@end
