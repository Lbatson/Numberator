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
    // Initialize class objects
    _image = [[Images alloc]init];
    _generator = [Generator sharedGenerator];
    _validator = [[Validator alloc]init];
    
    // Delegates
    _beginRange.delegate = self;
    _endRange.delegate = self;
    _amountToGenerate.delegate = self;
    
    // Add gesture recognizer to remove keyboard
    _singleTap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    _singleTap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_singleTap];
    
    // View specific design
    self.view.backgroundColor = [_image getDefaultBackground];
    _buttonArray = [NSArray arrayWithObjects:_generateButton,_clearButton, nil];
    [_image getDefaultButtonColors:_buttonArray];
    _beginRange.borderStyle = UITextBorderStyleRoundedRect;
    _endRange.borderStyle = UITextBorderStyleRoundedRect;
    _amountToGenerate.borderStyle = UITextBorderStyleRoundedRect;
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger currentLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = currentLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= 9 || returnKey;
}

- (IBAction)generatePressed:(UIButton *)sender
{
    _alert = [_validator isInputInvalidforBegin:_beginRange.text andEnd:_endRange.text withTotal:nil isDistinct:FALSE];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (IDIOM == IPAD) {
        return YES;
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
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
