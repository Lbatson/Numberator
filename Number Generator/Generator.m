//
//  Generator.m
//  Number Generator
//
//  Created by Lance  on 12/30/12.
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
    int range = ([end integerValue]-[start integerValue])+1;
    _singleNumber = [NSNumber numberWithInt:(arc4random()%range + [start integerValue])];
}

- (void)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total
{
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

- (void)generateDistinctListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total
{
    if (_listOfNumbers.count > 0) {
        [_listOfNumbers removeAllObjects];
    } else {
        _listOfNumbers = [NSMutableArray array];
    }
    for (int i = 0; i <= total; i++) {
        [_listOfNumbers addObject:[NSNumber numberWithFloat:i]];
    }
}

@end
