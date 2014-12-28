//
//  PhotoDetailViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController () <UITableViewDataSource, UITableViewDelegate>

  @property (weak, nonatomic) IBOutlet UIImageView *imageView;
  @property (weak, nonatomic) IBOutlet UITableView *tableView;

  @property NSArray *comments;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark TableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.comments;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{



}


@end
