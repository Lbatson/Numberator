//
//  Images.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "Images.h"

@implementation Images

@synthesize debut_dark_background = _debut_dark_background;
@synthesize blueButton = _blueButton;
@synthesize blueButtonHighlight = _blueButtonHighlight;
@synthesize greyButton = _greyButton;
@synthesize greyButtonHighlight = _greyButtonHighlight;

- (id)init
{
    if (self = [super init]) {
        _debut_dark_background = [UIImage imageNamed:@"debut_dark.png"];
        _blueButton = [[UIImage imageNamed:@"blueButton.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        _blueButtonHighlight = [[UIImage imageNamed:@"blueButtonHighlight.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        _greyButton = [[UIImage imageNamed:@"greyButton.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        _greyButtonHighlight = [[UIImage imageNamed:@"greyButtonHighlight.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    }
    return self;
}

@end
