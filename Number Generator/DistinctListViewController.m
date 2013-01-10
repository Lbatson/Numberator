//
//  DistinctListViewController.m
//  Number Generator
//
//  Created by Lance Batson  on 1/3/13.
//
//

#import "DistinctListViewController.h"

@interface DistinctListViewController ()

@end

@implementation DistinctListViewController

- (IBAction)generatePressed:(UIButton *)sender
{
    self.alert = [self.validator isInputInvalidforBegin:self.beginRange.text andEnd:self.endRange.text withTotal:nil isDistinct:YES];
    if (self.alert) {
        [self.alert show];
    } else {
        [self.generator generateDistinctListOfNumberswithRangeStarting:[NSNumber numberWithFloat:[self.beginRange.text floatValue]]
                                                             andEnding:[NSNumber numberWithFloat:[self.endRange.text floatValue]]];
        [self performSegueWithIdentifier:@"list" sender:nil];
    }
}

@end
