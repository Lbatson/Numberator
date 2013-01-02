//
//  NumberListViewController.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "NumberListViewController.h"

@interface NumberListViewController ()

@end

@implementation NumberListViewController

- (IBAction)generatePressed:(UIButton *)sender
{
    self.alert = [self.validator isInputInvalidforBegin:self.beginRange.text andEnd:self.endRange.text];
    if (self.alert) {
        [self.alert show];
    } else {
        if (_distinctSwitch.on) {
            NSLog(@"on");
        } else {
            NSLog(@"off");
        [self.generator generateListOfNumberswithRangeStarting:[NSNumber numberWithFloat:[self.beginRange.text floatValue]]
                                                     andEnding:[NSNumber numberWithFloat:[self.endRange.text floatValue]]
                                           withTotalToGenerate:1000];
        }
        [self performSegueWithIdentifier:@"list" sender:nil];
    }
}

@end