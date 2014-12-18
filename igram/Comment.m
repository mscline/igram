//
//  Comments.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Comment.h"

@implementation Comment
  @dynamic onDate, rePhoto, byUser, commentText;

+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
