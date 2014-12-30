//
//  Followers.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>
#import "UserRecord.h"

@interface Follower : PFObject <PFSubclassing>

  @property UserRecord *user;
  @property UserRecord *followingUser;

@end
