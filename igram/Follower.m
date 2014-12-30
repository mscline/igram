//
//  Followers.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Follower.h"

@implementation Follower
  @dynamic user, followingUser;

#warning replace strings with define

#pragma ADD AND DELETE RECORDS

+(void)addPersonThatYouWantToFollow:(UserRecord *)personToFollow withCompletionBlock:(void(^)(NSError *error))completionBlock
{
    Follower *record = [Follower object];
    record.user = [UserRecord returnOurUsersUserObject];
    record.followingUser = personToFollow;

    [record saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock(error);

    }];
}

+(void)removeFollower:(Follower *)removeME completionBlock:(void(^)(NSError *error))completionBlock
{

    [removeME deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock(error);

    }];

}


#pragma mark GET FOLLOWERS

+(void)getFollowersForUserRecord:(UserRecord *)personBeingFollowed completionBlock:(void(^)(NSError *error, NSArray *array))completionBlock
{

    PFQuery *query = [Follower query];
    [query whereKey:@"followingUser" equalTo:personBeingFollowed];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        completionBlock(error, objects);

    }];

}

+(void)getListOfPeopleFollowingUser:(UserRecord *)theUser completionBlock:(void(^)(NSError *error, NSArray *array))completionBlock
{

    PFQuery *query = [Follower query];
    [query whereKey:@"user" equalTo:theUser];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        completionBlock(error, objects);
        
    }];

}


#pragma mark PFSUBCLASS PROTOCOL METHODS

+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
