//
//  Validator.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "Validator.h"

@implementation Validator

@synthesize alert = _alert;
@synthesize alertString = _alertString;

- (id)init
{
    if (self = [super init]){
        // Additional setup for validator class
    }
    return self;
}

- (UIAlertView *)isInputInvalidforBegin:(NSString *)begin andEnd:(NSString *)end
{
    if ([self entryCheck:begin] && [self entryCheck:end]) {
        if ([self numberCheck:begin] && [self numberCheck:end]) {
            if ([self limitCheck:begin] && [self limitCheck:end]) {
                if([self rangeCheck:[begin integerValue] :[end integerValue]]) {
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
    if (![string isEqualToString:@""]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)numberCheck:(NSString *)string
{
    NSString *regex = @"^-{0,1}[0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:string]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)limitCheck:(NSString *)string
{
    if ([string integerValue] <= 10000) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)rangeCheck:(NSInteger)start :(NSInteger)finish
{
    if (start < finish){
        return TRUE;
    }
    return FALSE;
}

- (UIAlertView *)raiseAlert:(NSInteger)alertNum
{
    switch (alertNum) {
        case 0:
            _alertString = @"Enter values for range";
            break;
        case 1:
            _alertString = @"Invalid numbers for range";
            break;
        case 2:
            _alertString = @"Numbers cannot be greater than 10,000";
            break;
        case 3:
            _alertString = @"Range is not valid. Start of range must be smaller than end";
        default:
            break;
    }
    _alert = [[UIAlertView alloc]initWithTitle:nil message:_alertString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    return _alert;
}

@end

