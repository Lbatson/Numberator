//
//  GeneratorChoiceViewController.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "GeneratorChoiceViewController.h"

@interface GeneratorChoiceViewController ()

@end

@implementation GeneratorChoiceViewController

@synthesize singleNumberButton = _singleNumberButton;
@synthesize numberListButton = _numberListButton;
@synthesize settingsButton = _settingsButton;
@synthesize buttonArray = _buttonArray;
@synthesize image = _image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _image = [[Images alloc]init];
    _buttonArray = [NSArray arrayWithObjects:_singleNumberButton,_numberListButton,_settingsButton, nil];
    for (int i = 0; i < _buttonArray.count; i++) {
        [(UIButton *)[_buttonArray objectAtIndex:i] setBackgroundImage:_image.greyButton forState:UIControlStateNormal];
        [(UIButton *)[_buttonArray objectAtIndex:i] setBackgroundImage:_image.greyButtonHighlight forState:UIControlStateHighlighted];
        [(UIButton *)[_buttonArray objectAtIndex:i] setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:_image.debut_dark_background];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
