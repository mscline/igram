//
//  PhotoPickerCode.h
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MCCameraAndPhotoPicker <NSObject>

  -(void)yourNewPhotoIsHere:(UIImage *)image;

@end


@interface PhotoPickerCode : NSObject

  -(void)presentPhotoPickerViewControllerFromVC:(UIViewController *)vc;


@end
