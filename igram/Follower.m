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


+(void)addPersonThatYouWantToFollow:(UserRecord *)personToFollow withCompletionBlock:(void(^)(NSError *error))completionBlock
{
    Follower *record = [Follower object];
    record.actor = [UserRecord returnOurUsersUserObject];
    record.followingWhoID = personToFollow;

    [record saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock(error);

    }];
}

+(void)removePersonFromListOfFollowers:(UserRecord *)removeME
{

   /* Deleting Objects

    To delete an object from the cloud:

    [gameScore deleteInBackground];
    Objective-CSwift
    If you want to run a callback when the delete is confirmed, you can use the deleteInBackgroundWithBlock: or deleteInBackgroundWithTarget:selector: methods. If you want to block the calling thread, you can use the delete method.

    You can delete a single field from an object with the removeObjectForKey method:

    // After this, the playerName field will be empty
    [gameScore removeObjectForKey:@"playerName"];

    // Saves the field deletion to the Parse Cloud
    [gameScore saveInBackground];*/
}


+(void)getFollowersForUserRecord
{

}



+(NSString *)parseClassName
{

    return @"Users";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
