//
//  ViewController.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "SearchViewController.h"
#import <Parse/Parse.h>
#import "ParseLoginManager.h"
#import "UserRecord.h"
#import "CollectionViewCell.h"
#import "Photo.h"

@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

  @property ParseLoginManager *loginManager;
  @property NSMutableArray *dataForDisplay;

@end

@implementation SearchViewController 

-(void)viewDidLoad{
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.loginManager = [ParseLoginManager new];
    [self.loginManager presentLoginScreenFromRootVCsViewDidAppear:self];

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
    cell.caption.text = photo.caption;
    cell.backgroundColor = [UIColor redColor];

    [photo downloadImageToImageView:cell.photo forIndexPath:indexPath];

    return cell;

}

@end
