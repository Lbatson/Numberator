//
//  InformationViewController.h
//  Number Generator
//
//  Created by Lance Batson  on 1/3/13.
//
//

#import "GeneratorChoiceViewController.h"

@interface InformationViewController : GeneratorChoiceViewController

@property (weak, nonatomic) IBOutlet UITextView *informationHeader;
@property (weak, nonatomic) IBOutlet UITextView *informationArea;

@end
