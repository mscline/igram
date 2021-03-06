//
//  Comments.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>
#import "UserRecord.h"
#import "Photo.h"

@interface Comment : PFObject <PFSubclassing>


  @property Photo *forPhoto;
  @property UserRecord *byUser;
  @property NSDate *onDate;
  @property NSString *commentText;


  +(void)addCommentForPhoto:(Photo *)photoBeingCommentedOn textOfComment:(NSString *)commentText completionBlock:(void(^)())completionBlock;

  +(void)downloadCommentsForPhoto:(Photo *)photo completionBlock:(void(^)(NSArray *downloadedObjects, NSError *error))completionBlock;


@end
