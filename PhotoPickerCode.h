//
//  PhotoPickerCode.h
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

// 1) create new PhotoPickerCode object and store as property (or will deallocate)
// 2) call -presentPhotoPickerViewControllerFromVC
// 3) implement -yourNewPhotIsHere protocol method

@protocol MCCameraAndPhotoPicker <NSObject>

  -(void)yourNewPhotoIsHere:(UIImage *)image;

@end


@interface PhotoPickerCode : NSObject


  -(void)presentPhotoPickerViewControllerFromVC:(UIViewController *)vc;

  // for Parse 
  +(PFFile *)createPFFileForImage:(UIImage *)image;


@end
