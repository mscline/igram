//
//  MCBuildAttributedText.h
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCBuildAttributedText : NSObject

  +(NSAttributedString *)createAttributedString:(NSString *)text withFont:(NSString *)fontX fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor nsTextAlignmentStyle:(int)alignment;

  +(NSAttributedString *)combineAttributedStrings:(NSArray *)arrayOfAttributedStrings;

@end

/* 
 
 COMMON FONTS:
 
 Palatino-Roman


*/