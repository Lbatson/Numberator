//
//  SingleNumberViewController.h
//  Number Generator
//
//  Created by Lance Batson  on 12/29/12.
//
//

#import <UIKit/UIKit.h>
#import "Images.h"
#import "Validator.h"
#import "Generator.h"

@interface SingleNumberViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *beginRange;
@property (weak, nonatomic) IBOutlet UITextField *endRange;
@property (weak, nonatomic) IBOutlet UITextField *amountToGenerate;
@property (weak, nonatomic) IBOutlet UILabel *singleNumberDisplay;
@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) NSArray *buttonArray;
@property (strong, nonatomic) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) UIAlertView *alert;
@property (strong, nonatomic) Validator *validator;
@property (strong, nonatomic) Generator *generator;
@property (strong, nonatomic) Images *image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)viewDidLoad;
- (IBAction)generatePressed:(UIButton *)sender;
- (void)displayNumber:(NSNumber *)number;
- (IBAction)clearPressed:(UIButton *)sender;
- (void)clear;
- (void)dismissKeyboard;
- (void)didReceiveMemoryWarning;
- (void)viewDidUnload;

@end
