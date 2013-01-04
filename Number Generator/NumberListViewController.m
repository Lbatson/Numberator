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
    self.alert = [self.validator isInputInvalidforBegin:self.beginRange.text andEnd:self.endRange.text withTotal:_amountToGenerate.text isDistinct:FALSE];
    if (self.alert) {
        [self.alert show];
    } else {
        [self.generator generateListOfNumberswithRangeStarting:[NSNumber numberWithFloat:[self.beginRange.text floatValue]]
                                                         andEnding:[NSNumber numberWithFloat:[self.endRange.text floatValue]]
                                               withTotalToGenerate:[_amountToGenerate.text integerValue]];
        [self performSegueWithIdentifier:@"list" sender:nil];
    }
}

- (void)clear
{
    self.beginRange.text = @"";
    self.endRange.text = @"";
    self.singleNumberDisplay.text = @"";
    _amountToGenerate.text = @"";
}

@end