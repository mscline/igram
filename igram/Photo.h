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

  // Local Properties
  @property UIImage *photoImage;  // when download, can use just grab the image here

  -(void)downloadImageToImageView:(UIImageView *)view forIndexPath:(NSIndexPath *)indexPath;

@end
