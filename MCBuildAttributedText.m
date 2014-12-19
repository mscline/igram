//
//  MCBuildAttributedText.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "MCBuildAttributedText.h"

@implementation MCBuildAttributedText


+(NSAttributedString *)createAttributedString:(NSString *)text withFont:(NSString *)fontName fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor nsTextAlignmentStyle:(int)alignment
{


    NSMutableAttributedString *artString = [[NSMutableAttributedString alloc] initWithString:text];

    // if no text, exit
    if([text isEqualToString:@""]){ return artString; }


    // else, build attributes
    UIFont *fontX = [UIFont fontWithName:fontName  size:fontSize];

    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = alignment;

    NSRange artStringRange = NSMakeRange(0, (int)[artString length]);


    // set attributes
    [artString addAttribute:NSFontAttributeName            value:fontX          range:artStringRange];
    [artString addAttribute:NSForegroundColorAttributeName value:fontColor      range:artStringRange];
    [artString addAttribute:NSParagraphStyleAttributeName  value:paragraphStyle range:artStringRange];

    return artString;

}

+(NSAttributedString *)combineAttributedStrings:(NSArray *)arrayOfAttributedStrings
{

    NSMutableAttributedString *artString = [[NSMutableAttributedString alloc] initWithString:@""];

    for(NSAttributedString *insertMe in arrayOfAttributedStrings){


        [artString appendAttributedString:insertMe];

    }

    return artString;

}

@end
