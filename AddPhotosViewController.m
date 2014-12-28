//
//  AddPhotosViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "AddPhotosViewController.h"
#import "TabBarViewController.h"
#import "PhotoPickerCode.h"
#import "MCBuildAttributedText.h"

#import "Photo.h"


@interface AddPhotosViewController () <MCCameraAndPhotoPicker, TabBarItemSelected>

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

    // when return from picker, want to display the photo
    self.imageView.image = self.imageForDisplay;

}

-(void)tabBarItemWasSelected
{}


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

    [self changeBackgroundColorTemporarilyWithDuration:2.0 color:[UIColor greenColor]];

}

-(void)notifyUserThatNoImage
{

    [self changeBackgroundColorTemporarilyWithDuration:.3 color:[UIColor redColor]];

    // change ImageView to black
    [UIView animateWithDuration:3 animations:^{

        self.imageView.backgroundColor = [UIColor blackColor];

    } completion:^(BOOL finished) {}];

}

-(void)changeBackgroundColorTemporarilyWithDuration:(float)duration color:(UIColor *)color
{

    UIColor *backgroundColor = self.view.backgroundColor;

    self.view.backgroundColor = color;

    [UIView animateWithDuration:duration animations:^{

        self.view.backgroundColor = backgroundColor;

    } completion:^(BOOL finished) {}];


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
