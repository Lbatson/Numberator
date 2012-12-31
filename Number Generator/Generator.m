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
        // Additional setup for generator singleton
    }
    return self;
}

- (NSNumber *)generateSingleNumberWithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end
{
    int range = ([end integerValue]-[start integerValue])+1;
    _singleNumber = [NSNumber numberWithInt:(arc4random()%range + [start integerValue])];
    return _singleNumber;
}

- (NSArray *)generateListOfNumberswithRangeStarting:(NSNumber *)start andEnding:(NSNumber *)end withTotalToGenerate:(NSInteger)total
{
    return _listOfNumbers;
}

@end
