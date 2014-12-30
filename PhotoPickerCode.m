//
//  PhotoPickerCode.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "PhotoPickerCode.h"

@interface PhotoPickerCode() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

  @property UIImagePickerController *picker;
  @property id<MCCameraAndPhotoPicker>delegate;

@end


@implementation PhotoPickerCode
  @synthesize picker;

-(void)presentPhotoPickerViewControllerFromVC:(UIViewController *)vc
{
    self.delegate = (id)vc;  // your vc will be your delegate

    picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [vc presentViewController:picker animated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {

    [Picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *) Picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *rawImageFromPicker = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.delegate yourNewPhotoIsHere:rawImageFromPicker];
    [Picker dismissViewControllerAnimated:YES completion:nil];
}

+(PFFile *)createPFFileForImage:(UIImage *)image
{

    NSData *imageData = UIImagePNGRepresentation(image);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];

    return imageFile;
    
}

@end
