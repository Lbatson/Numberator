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
@synthesize singleNumberDisplay = _singleNumberDisplay;
@synthesize singleTap = _singleTap;
@synthesize validator = _validator;

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
	// Additional setup after loading the view.
    generator = [Generator sharedGenerator];
    _validator = [[Validator alloc]init];
    _singleTap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:_singleTap];
}

- (IBAction)generatePressed:(UIButton *)sender
{
    _alert = [_validator isInputInvalidforBegin:_beginRange.text andEnd:_endRange.text];
    if (_alert) {
        [_alert show];
    } else {
        [self displayNumber:[generator generateSingleNumberWithRangeStarting:
                             [NSNumber numberWithFloat:[_beginRange.text floatValue]] andEnding:
                             [NSNumber numberWithFloat:[_endRange.text floatValue]]]];
    }
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
