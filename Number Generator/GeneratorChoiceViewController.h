//
//  GeneratorChoiceViewController.h
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import <UIKit/UIKit.h>
#import "Images.h"

@interface GeneratorChoiceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *singleNumberButton;
@property (weak, nonatomic) IBOutlet UIButton *numberListButton;
@property (strong, nonatomic) Images *image;

@end
