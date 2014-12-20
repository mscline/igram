//
//  ProfileViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "ProfileViewController.h"
#import "TabBarViewController.h"
#import "CollectionViewCellForProfilePhotos.h"

@interface ProfileViewController () <TabBarItemSelected, UICollectionViewDataSource>

  @property NSMutableArray *yourPhotos;

@end


@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.yourPhotos = [NSMutableArray arrayWithObjects:@"a", "b", nil];
}

-(void)tabBarItemWasSelected
{

    [self showProfilePhoto];
    [self downloadThePhotosIHaveAdded];

}


-(void)showProfilePhoto
{


}

-(void)downloadThePhotosIHaveAdded
{


}


#pragma mark CollectionView DataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 3; //[self.yourPhotos count];

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CollectionViewCellForProfilePhotos *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"c" forIndexPath:indexPath];

    cell.backgroundColor = [UIColor redColor];

    return cell;
}


@end
