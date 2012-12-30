//
//  SingleNumberViewController.h
//  Number Generator
//
//  Created by Lance  on 12/29/12.
//
//

#import <UIKit/UIKit.h>

@interface SingleNumberViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beginRange;
@property (weak, nonatomic) IBOutlet UITextField *endRange;
@property (weak, nonatomic) IBOutlet UILabel *singleNumberDisplay;

@end
