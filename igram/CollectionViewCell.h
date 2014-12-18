//
//  CollectionViewCell.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell


  @property (weak, nonatomic) IBOutlet UILabel *caption;
  @property (weak, nonatomic) IBOutlet UIImageView *photo;


@end
