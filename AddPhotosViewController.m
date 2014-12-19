//
//  AddPhotosViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "AddPhotosViewController.h"
#import "PhotoPickerCode.h"


@interface AddPhotosViewController () <MCCameraAndPhotoPicker>

  @property (weak, nonatomic) IBOutlet UIImageView *imageView;
  @property UIImage *imageForDisplay;
  @property PhotoPickerCode *pickerManager;

@end


@implementation AddPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.image = self.imageForDisplay;

}
- (IBAction)onButtonPressedSelectPhoto:(id)sender {

    [self showPhotoPicker];
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
