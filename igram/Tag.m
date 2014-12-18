//
//  Tags.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Tag.h"

@implementation Tag
  @dynamic photoID, tagName;

+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
