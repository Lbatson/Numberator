//
//  InformationViewController.m
//  Number Generator
//
//  Created by Lance  on 1/3/13.
//
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [self.image getDefaultBackground];
    _informationHeader.backgroundColor = [UIColor clearColor];
    _informationHeader.textColor = [UIColor whiteColor];
    _informationArea.backgroundColor = [UIColor clearColor];
    _informationArea.textColor = [UIColor whiteColor];
}

@end
