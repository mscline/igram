//
//  TabBarViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "TabBarViewController.h"
#import "ParseLoginManager.h"
#import "UserRecord.h"
#import "ParseFile.h"

@interface TabBarViewController () <UITabBarControllerDelegate>

  @property ParseLoginManager *loginManager;

@end


@implementation TabBarViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    [UserRecord createNewUserRecordIfRequired:^{}];  // this will be run again when return from login VC

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.loginManager = [ParseLoginManager new];
    [self.loginManager presentLoginScreenFromRootVCsViewDidAppear:self];



    // testing

    [ParseFile uploadFileWithName:@"secondTrie" typeIdentifier:@"b" date:[NSDate date] completionBlock:^(NSError *error) {


    }];

    [ParseFile makeListOfFilesOnServer:@"b" afterDate:nil withCompletionBlock:^(NSError *error, NSArray *objects) {

        NSLog(@"here %@", objects);

    }];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{

    // tell view controller corresponding tab selected
    id<TabBarItemSelected>selectedVC = (id)self.selectedViewController;
    [selectedVC tabBarItemWasSelected];
    
}

@end
