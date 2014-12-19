//
//  ViewController.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "SearchViewController.h"
#import "TabBarViewController.h"

#import <Parse/Parse.h>
#import "ParseLoginManager.h"
#import "MCBuildAttributedText.h"

#import "UserRecord.h"
#import "Photo.h"

#import "CollectionViewCell.h"


@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, TabBarItemSelected>

  @property ParseLoginManager *loginManager;
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
    [self tabBarItemWasSelected];

}

-(void)tabBarItemWasSelected
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
    cell.caption.attributedText = [self formatLabel:photo.caption];

    [photo downloadImageAndUpdateImageView:cell.photo forIndexPath:indexPath];

    return cell;

}

-(NSAttributedString *)formatLabel:(NSString *)str
{

    // if no string, exit
    if(!str || str.length == 0){ return [NSAttributedString new]; };


    // want to make first letter bigger
    // divide into two strings
    NSString *str1 = [str substringToIndex:1];
    NSString *str2 = [str substringFromIndex:1];

    // format
    NSAttributedString *text1 = [MCBuildAttributedText createAttributedString:str1
                                         withFont:@"Palatino-Roman"
                                         fontSize:18.0 fontColor:[UIColor blueColor]
                             nsTextAlignmentStyle:NSTextAlignmentCenter];

    NSAttributedString *text2 = [MCBuildAttributedText createAttributedString:str2
                                                                    withFont:@"Palatino-Roman"
                                                                    fontSize:14.0 fontColor:[UIColor blackColor]
                                                        nsTextAlignmentStyle:NSTextAlignmentCenter];

    // combine & return
    return [MCBuildAttributedText combineAttributedStrings:[NSArray arrayWithObjects:
                                                            text1, text2, nil]];


}

@end
