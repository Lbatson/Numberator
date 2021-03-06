//
//  GeneratorChoiceViewController.h
//  Number Generator
//
//  Created by Lance Batson  on 12/31/12.
//
//

#import <UIKit/UIKit.h>
#import "Images.h"

@interface GeneratorChoiceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *singleNumberButton;
@property (weak, nonatomic) IBOutlet UIButton *numberListButton;
@property (weak, nonatomic) IBOutlet UIButton *distinctListButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) NSArray *buttonArray;
@property (strong, nonatomic) Images *image;

@end
