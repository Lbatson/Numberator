//
//  Validator.h
//  Number Generator
//
//  Created by Lance  on 12/31/12.
//
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

@property (strong, nonatomic) UIAlertView *alert;
@property (strong, nonatomic) NSString *alertString;

- (UIAlertView *)isInputInvalidforBegin:(NSString *)begin andEnd:(NSString *)end;

@end
