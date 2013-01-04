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
@synthesize greyButton = _greyButton;
@synthesize greyButtonHighlight = _greyButtonHighlight;

- (id)init
{
    if (self = [super init]) {
        _debut_dark_background = [UIImage imageNamed:@"triangles.png"];
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
    return [UIColor colorWithPatternImage:_debut_dark_background];
}

@end
