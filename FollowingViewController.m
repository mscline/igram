//
//  FollowingViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "FollowingViewController.h"
#import "TabBarViewController.h"
#import "CollectionViewCellForFollowers.h"


@interface FollowingViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, TabBarItemSelected>

  @property NSMutableArray *dataForDisplay;

@end


@implementation FollowingViewController

// to show list of people can follow
// download list of all users (parse query)
// each user has people they are following (a one-to-many relationship)
// which may be downloaded with our intial query using includeKey


// show list of followers - query
// show list of who you are following - query

-(void)tabBarItemWasSelected
{

   // [self downloadListOfFollowers];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self downloadListOfFollowers];
}



-(void)downloadListOfFollowers
{
//    [Photo downloadPhotosWithCompletionBlock:^(NSArray *objects) {
//
//        [self downloadOfPhotosIsComplete:objects];
//
//    }];

    self.dataForDisplay = @[@"a",@"b"].mutableCopy;

}

-(void)downloadOfPhotosIsComplete:(NSArray *)array
{

    self.dataForDisplay = array.mutableCopy;
//    [self.collectionV reloadData];

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

    CollectionViewCellForFollowers *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"f" forIndexPath:indexPath];
//
//    Photo *photo = [self.dataForDisplay objectAtIndex:indexPath.row];
      cell.backgroundColor = [UIColor redColor];
//    cell.name.attributedText = [self formatLabel:photo.caption];
//
//    [photo downloadImageAndUpdateImageView:cell.photo forIndexPath:indexPath];

    return cell;

}



@end
