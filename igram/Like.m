//
//  Likes.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Like.h"

@implementation Like
  @dynamic onDate, idOfPhotoLiked, byUser;

+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
