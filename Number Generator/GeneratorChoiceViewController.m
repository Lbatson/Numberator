//
//  GeneratorChoiceViewController.m
//  Number Generator
//
//  Created by Lance Batson  on 12/31/12.
//
//

#import "GeneratorChoiceViewController.h"

@interface GeneratorChoiceViewController ()

@end

@implementation GeneratorChoiceViewController

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
    _buttonArray = [NSArray arrayWithObjects:_singleNumberButton,_numberListButton,_distinctListButton, nil];
    [_image getDefaultButtonColors:_buttonArray];
    self.view.backgroundColor = [_image getDefaultBackground];
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
    } else {
        // Load resources for iOS 7 or later
        [_infoButton setTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
