//
//  Validator.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "Validator.h"

@implementation Validator
{
    UIAlertView *alert;
    NSString *alertString;
}

- (id)init
{
    if (self = [super init]){
    }
    return self;
}

- (UIAlertView *)isInputInvalidforBegin:(NSString *)begin andEnd:(NSString *)end withTotal:(NSString *)total isDistinct:(BOOL)distinct
{
    // Runs through alert checks
    if ([self entryCheck:begin] && [self entryCheck:end]) {
        if ([self numberCheck:begin] && [self numberCheck:end]) {
            if ([self rangeCheck:[begin integerValue] to:[end integerValue]]) {
                if ([self limitListCheck:total]) {
                    if (!distinct){
                        return nil;
                    } else if (distinct && [self limitRangeCheck:begin to:end]){
                        return nil;
                    } else {
                        return [self raiseAlert:4];
                    }
                    return nil;
                } else {
                    return [self raiseAlert:3];
                }
            } else {
                return [self raiseAlert:2];
            }
        } else {
            return [self raiseAlert:1];
        }
    } else {
        return [self raiseAlert:0];
    }
    return nil;
}

- (BOOL)entryCheck:(NSString *)string
{
    // Check to insure range fields have values
    if (![string isEqualToString:@""]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)numberCheck:(NSString *)string
{
    // Could handle negative numbers
    // NSString *regex = @"^-{0,1}[0-9]*";
    
    // Check to insure only numbers are put into text fields
    NSString *regex = @"^[0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:string]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)rangeCheck:(NSInteger)start to:(NSInteger)finish
{
    // Check to insure min is lower than max for range
    if (start < finish){
        return TRUE;
    }
    return FALSE;
}

- (BOOL)limitListCheck:(NSString *)number
{
    // Check to insure amount to generate for number list is under 100,000 and has a value
    if ([number integerValue] <= 100000 && ![number isEqualToString:@""]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)limitRangeCheck:(NSString *)begin to:(NSString *)end
{
    if ((end.integerValue - begin.integerValue) <= 10000) {
        return TRUE;
    }
    return FALSE;
}

- (UIAlertView *)raiseAlert:(NSInteger)alertNum
{
    // Determines which alert to display
    switch (alertNum) {
        case 0:
            alertString = @"Enter values for range";
            break;
        case 1:
            alertString = @"Values not valid for range";
            break;
        case 2:
            alertString = @"Range is not valid. Min must be smaller than Max";
            break;
        case 3:
            alertString = @"Amount to generate must be greater than 0 and less than 10,000";
            break;
        case 4:
            alertString = @"Total range of numbers must be less than 10,000";
            break;
        default:
            break;
    }
    alert = [[UIAlertView alloc]initWithTitle:nil message:alertString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    return alert;
}

@end

