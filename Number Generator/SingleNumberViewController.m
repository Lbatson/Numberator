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
    _image = [[Images alloc]init];
    _generator = [Generator sharedGenerator];
    _validator = [[Validator alloc]init];
    _singleTap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:_singleTap];
    [_generateButton setBackgroundImage:_image.greyButton forState:UIControlStateNormal];
    [_generateButton setBackgroundImage:_image.greyButtonHighlight forState:UIControlStateHighlighted];
    [_generateButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [_clearButton setBackgroundImage:_image.greyButton forState:UIControlStateNormal];
    [_clearButton setBackgroundImage:_image.greyButtonHighlight forState:UIControlStateHighlighted];
    [_clearButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.view.backgroundColor = [UIColor colorWithPatternImage:_image.debut_dark_background];
}

- (IBAction)generatePressed:(UIButton *)sender
{
    _alert = [_validator isInputInvalidforBegin:_beginRange.text andEnd:_endRange.text];
    if (_alert) {
        [_alert show];
    } else {
        [_generator generateSingleNumberWithRangeStarting:[NSNumber numberWithFloat:[_beginRange.text floatValue]]
                                                andEnding:[NSNumber numberWithFloat:[_endRange.text floatValue]]];
        [self displayNumber:_generator.singleNumber];
    }
}

- (void)displayNumber:(NSNumber *)number
{
    _singleNumberDisplay.text = number.stringValue;
}

- (IBAction)clearPressed:(UIButton *)sender
{
    [self clear];
}

- (void)clear
{
    _beginRange.text = @"";
    _endRange.text = @"";
    _singleNumberDisplay.text = @"";
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
}

@end
