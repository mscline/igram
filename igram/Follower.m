//
//  Followers.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Follower.h"

@implementation Follower
  @dynamic actor, followingWhoID;

+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
