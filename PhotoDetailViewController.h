//
//  PhotoDetailViewController.h
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoDetailViewController : UIViewController 

  @property Photo *photo;
  @property UIImage *photoImage;  // the photo object does not actuall store the image

@end
