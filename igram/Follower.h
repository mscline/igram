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


  +(void)addPersonThatYouWantToFollow:(UserRecord *)personToFollow withCompletionBlock:(void(^)(NSError *error))completionBlock;

  +(void)removeFollower:(Follower *)removeME completionBlock:(void(^)(NSError *error))completionBlock;

  +(void)getFollowersForUserRecord:(UserRecord *)personBeingFollowed completionBlock:(void(^)(NSError *error, NSArray *array))completionBlock;

  +(void)getListOfPeopleFollowingUser:(UserRecord *)theUser completionBlock:(void(^)(NSError *error, NSArray *array))completionBlock;


@end
