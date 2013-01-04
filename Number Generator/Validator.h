//
//  Validator.h
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

- (UIAlertView *)isInputInvalidforBegin:(NSString *)begin andEnd:(NSString *)end withTotal:(NSString *)total isDistinct:(BOOL)distinct;

@end
