//
//  Photos.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>
#import "UserRecord.h"

@interface Photo : PFObject <PFSubclassing>

  @property PFFile *imageFile; // rem: won't be implicitly loaded
  @property UserRecord *byUser;
  @property NSString *caption;
  @property NSDate *date;

  // Many to Many
  @property NSString *tags;  // ????



  +(void)addPhoto:(UIImage *)image caption:(NSString *)caption completionBlock:(void(^)())completionBlock;
  +(void)downloadPhotosWithCompletionBlock:(void(^)(NSArray *objects))completionBlock
;
  -(void)downloadImageAndUpdateImageView:(UIImageView *)view forIndexPath:(NSIndexPath *)indexPath;

@end

// http://cocoadocs.org/docsets/Parse/1.2.20/Classes/PFQuery.html#

// ONE TO ONE'

//includeKey:
//
//- (void)includeKey:(NSString *)key
//Discussion
//
//Make the query include PFObjects that have a reference stored at the provided key. This has an effect similar to a join. You can use dot notation to specify which fields in the included object are also fetch.
