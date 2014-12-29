//
//  Comments.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Comment.h"

@implementation Comment
  @dynamic onDate, forPhoto, byUser, commentText;


+(void)addCommentForPhoto:(Photo *)photoBeingCommentedOn textOfComment:(NSString *)commentText completionBlock:(void(^)())completionBlock
{
    Comment *comment = [Comment object];
    comment.byUser = [UserRecord returnOurUsersUserObject];
    comment.forPhoto = photoBeingCommentedOn;
    comment.commentText = commentText;
    comment.onDate = [NSDate date];

    [comment saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock();

    }];

}


+(void)downloadCommentsForPhoto:(Photo *)photo completionBlock:(void(^)(NSArray *downloadedObjects, NSError *error))completionBlock
{
    PFQuery *query = [Comment query];
    [query whereKey:@"forPhoto" equalTo:photo];
    [query orderByDescending:@"createdAt"];
    query.limit = 100;

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        completionBlock(objects, error);
        
    }];
}


#pragma PFSubclassing Protocol

+(NSString *)parseClassName
{

    return @"Comments";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
