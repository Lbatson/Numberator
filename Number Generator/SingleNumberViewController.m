//
//  SingleNumberViewController.m
//  Number Generator
//
//  Created by Lance  on 12/29/12.
//
//

#import "SingleNumberViewController.h"

@interface SingleNumberViewController ()

@end

@implementation SingleNumberViewController
{
    Generator *generator;
}

@synthesize beginRange = _beginRange;
@synthesize endRange = _endRange;
@synthesize alert = _alert;
@synthesize alertString = _alertString;
@synthesize singleNumberDisplay = _singleNumberDisplay;
@synthesize singleTap = _singleTap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    generator = [Generator sharedGenerator];
    _singleTap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:_singleTap];
}

- (IBAction)generatePressed:(UIButton *)sender
{
    if ([self inputValidforBegin:_beginRange.text andEnd:_endRange.text]) {
        [self displayNumber:[generator generateSingleNumberWithRangeStarting:
                             [NSNumber numberWithFloat:[_beginRange.text floatValue]] andEnding:
                             [NSNumber numberWithFloat:[_endRange.text floatValue]]]];
    }
}

- (BOOL)inputValidforBegin:(NSString *)begin andEnd:(NSString *)end
{
    if (![begin isEqualToString:@""] && ![end isEqualToString:@""]) {
        if ([self numberCheck:begin] && [self numberCheck:end]) {
            if ([self limitCheck:begin] && [self limitCheck:end]) {
                if([self rangeCheck:[begin integerValue] :[end integerValue]]) {
                    return TRUE;
                } else {
                    [self displayAlert:3];
                    return FALSE;
                }
            } else {
                [self displayAlert:2];
                return FALSE;
            }
        } else {
            [self displayAlert:1];
            return FALSE;
        }
    } else {
        [self displayAlert:0];
        return FALSE;
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

- (void)displayAlert:(NSInteger)alertNum
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
            _alertString = @"Range is not valid";
        default:
            break;
    }
    _alert = [[UIAlertView alloc]initWithTitle:nil message:_alertString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [_alert show];
    [self clearInput];
}

- (void)displayNumber:(NSNumber *)number
{
    _singleNumberDisplay.text = number.stringValue;
}

- (IBAction)clearInputPressed:(UIButton *)sender
{
    [self clearInput];
}

- (void)clearInput
{
    _beginRange.text = @"";
    _endRange.text = @"";
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBeginRange:nil];
    [self setEndRange:nil];
    [self setSingleNumberDisplay:nil];
    [super viewDidUnload];
}
@end
