//
//  ViewController.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "SearchViewController.h"
#import "TabBarViewController.h"
#import "PhotoDetailViewController.h"

#import <Parse/Parse.h>
#import "CustomTextFormatter.h"

#import "UserRecord.h"
#import "Photo.h"

#import "CollectionViewCell.h"


@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, TabBarItemSelected>

  @property NSMutableArray *dataForDisplay;

  @property (weak, nonatomic) IBOutlet UICollectionView *collectionV;

@end


@implementation SearchViewController 

-(void)viewDidLoad{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // since default view
    [self downloadPhotos];

}

-(void)tabBarItemWasSelected
{

    [self downloadPhotos];
    
}

-(void)downloadPhotos
{
    [Photo downloadPhotosWithCompletionBlock:^(NSArray *objects) {

        [self downloadOfPhotosIsComplete:objects];

    }];
}

-(void)downloadOfPhotosIsComplete:(NSArray *)array
{

    self.dataForDisplay = array.mutableCopy;
    [self.collectionV reloadData];

}


#pragma mark CollectionView Data Source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return [self.dataForDisplay count];

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"a" forIndexPath:indexPath];

    Photo *photo = [self.dataForDisplay objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    cell.caption.attributedText = [CustomTextFormatter formatLabel:photo.caption];

    // we want to download the photo and update the cell when we get it
    [photo downloadImageAndUpdateImageView:cell.photo forIndexPath:indexPath];

    return cell;

}


#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    NSIndexPath *indexPath = [self.collectionV indexPathForCell:(UICollectionViewCell *)sender];

    PhotoDetailViewController *vc = segue.destinationViewController;
    vc.photo = [self.dataForDisplay objectAtIndex:indexPath.row];
    
}


@end
