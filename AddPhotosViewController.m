//
//  AddPhotosViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "AddPhotosViewController.h"
#import "PhotoPickerCode.h"
#import "Photo.h"


@interface AddPhotosViewController () <MCCameraAndPhotoPicker>

  @property (weak, nonatomic) IBOutlet UIImageView *imageView;
  @property (weak, nonatomic) IBOutlet UITextField *textField;

  @property UIImage *imageForDisplay;
  @property PhotoPickerCode *pickerManager;

@end


@implementation AddPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.image = self.imageForDisplay;

}


#pragma mark Buttons

- (IBAction)onButtonPressedSelectPhoto:(id)sender {

    [self showPhotoPicker];
}

- (IBAction)onButtonPressedUploadPhoto:(id)sender {

    [self addPhotoToDB];
}


#pragma mark Add Photo

-(void)addPhotoToDB
{

    // if no photo exit
    if(!self.imageView.image){

        [self notifyUserThatNoImage];
        return;
    }

    // add photo
    [Photo addPhoto:self.imageView.image caption:self.textField.text completionBlock:^{

        [self photoUploadComplete];
        NSLog(@"add error handling");
    }];

}

-(void)photoUploadComplete
{



}

-(void)notifyUserThatNoImage
{

    UIColor *backgroundColor = self.view.backgroundColor;
    //UIColor *imageViewColor = self.imageView.backgroundColor;

    [UIView animateWithDuration:.15 animations:^{

        self.view.backgroundColor = [UIColor redColor];

    } completion:^(BOOL finished) {

        self.view.backgroundColor = backgroundColor;
        
    }];

    [UIView animateWithDuration:3 animations:^{

        self.imageView.backgroundColor = [UIColor blackColor];

    } completion:^(BOOL finished) {

        //self.imageView.backgroundColor = imageViewColor;

    }];

}

#pragma mark Photo Picker

-(void)showPhotoPicker
{

    self.pickerManager = [PhotoPickerCode new];
    [self.pickerManager presentPhotoPickerViewControllerFromVC:self];

}

-(void)yourNewPhotoIsHere:(UIImage *)image
{

    self.imageForDisplay = image;

}



@end
