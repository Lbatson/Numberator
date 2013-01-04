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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
