//
//  Images.h
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import <UIKit/UIKit.h>

@interface Images : UIImage

@property (strong, nonatomic) UIImage *greyButton;
@property (strong, nonatomic) UIImage *greyButtonHighlight;

- (void)getDefaultButtonColors:(NSArray *)buttonArray;
- (UIColor *)getDefaultBackground;

@end
