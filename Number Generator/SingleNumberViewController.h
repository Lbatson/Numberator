//
//  SingleNumberViewController.h
//  Number Generator
//
//  Created by Lance  on 12/29/12.
//
//

#import <UIKit/UIKit.h>
#import "Validator.h"
#import "Generator.h"

@interface SingleNumberViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *beginRange;
@property (weak, nonatomic) IBOutlet UITextField *endRange;
@property (strong, nonatomic) UIAlertView *alert;
@property (weak, nonatomic) IBOutlet UILabel *singleNumberDisplay;
@property (weak, nonatomic) IBOutlet UISwitch *distinctSwitch;
@property (strong, nonatomic) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) Validator *validator;
@property (strong, nonatomic) Generator *generator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)viewDidLoad;
- (IBAction)generatePressed:(UIButton *)sender;
- (void)displayNumber:(NSNumber *)number;
- (IBAction)clearInputPressed:(UIButton *)sender;
- (void)clearInput;
- (void)dismissKeyboard;
- (void)didReceiveMemoryWarning;
- (void)viewDidUnload;

@end
