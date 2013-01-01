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
    [_singleNumberButton setBackgroundImage:_image.greyButton forState:UIControlStateNormal];
    [_singleNumberButton setBackgroundImage:_image.greyButtonHighlight forState:UIControlStateHighlighted];
    [_singleNumberButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [_numberListButton setBackgroundImage:_image.greyButton forState:UIControlStateNormal];
    [_numberListButton setBackgroundImage:_image.greyButtonHighlight forState:UIControlStateHighlighted];
    [_numberListButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    self.view.backgroundColor = [UIColor colorWithPatternImage:_image.debut_dark_background];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
