//
//  Images.m
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import "Images.h"

@implementation Images

@synthesize greyButton = _greyButton;
@synthesize greyButtonHighlight = _greyButtonHighlight;

- (id)init
{
    if (self = [super init]) {
        _greyButton = [[UIImage imageNamed:@"greyButton.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        _greyButtonHighlight = [[UIImage imageNamed:@"greyButtonHighlight.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    }
    return self;
}

- (void)getDefaultButtonColors:(NSArray *)buttonArray
{
    for (int i = 0; i < buttonArray.count; i++){
        [((UIButton *)[buttonArray objectAtIndex:i]) setBackgroundImage:_greyButton forState:UIControlStateNormal];
        [((UIButton *)[buttonArray objectAtIndex:i]) setBackgroundImage:_greyButtonHighlight forState:UIControlStateHighlighted];
        [((UIButton *)[buttonArray objectAtIndex:i]) setTitleColor:nil forState:UIControlStateHighlighted];
    }
}

- (UIColor *)getDefaultBackground
{
    return [UIColor colorWithRed:47.0/255 green:47.0/255 blue:47.0/255 alpha:1.0];
}

@end
