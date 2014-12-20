//
//  CustomTextFormatter.m
//  igram
//
//  Created by xcode on 12/19/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "CustomTextFormatter.h"
#import "MCBuildAttributedText.h"

@implementation CustomTextFormatter

+(NSAttributedString *)formatLabel:(NSString *)str
{

    // if no string, exit
    if(!str || str.length == 0){ return [NSAttributedString new]; };


    // want to make first letter bigger
    // divide into two strings
    NSString *str1 = [str substringToIndex:1];
    NSString *str2 = [str substringFromIndex:1];

    // format
    NSAttributedString *text1 = [MCBuildAttributedText createAttributedString:str1
                                                                     withFont:@"Palatino-Roman"
                                                                     fontSize:18.0 fontColor:[UIColor blueColor]
                                                         nsTextAlignmentStyle:NSTextAlignmentCenter];

    NSAttributedString *text2 = [MCBuildAttributedText createAttributedString:str2
                                                                     withFont:@"Palatino-Roman"
                                                                     fontSize:14.0 fontColor:[UIColor blackColor]
                                                         nsTextAlignmentStyle:NSTextAlignmentCenter];

    // combine & return
    return [MCBuildAttributedText combineAttributedStrings:[NSArray arrayWithObjects:
                                                            text1, text2, nil]];
    
    
}

@end
