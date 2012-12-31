//
//  SingleNumberViewController.h
//  Number Generator
//
//  Created by Lance  on 12/29/12.
//
//

#import <UIKit/UIKit.h>
#import "Generator.h"

@interface SingleNumberViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *beginRange;
@property (weak, nonatomic) IBOutlet UITextField *endRange;
@property (strong, nonatomic) UIAlertView *alert;
@property (strong, nonatomic) NSString *alertString;
@property (weak, nonatomic) IBOutlet UILabel *singleNumberDisplay;
@property (strong, nonatomic) UITapGestureRecognizer *singleTap;

@end
