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
#import "Follower.h"

@interface TabBarViewController () <UITabBarControllerDelegate>

  @property ParseLoginManager *loginManager;

@end


@implementation TabBarViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    [UserRecord createNewUserRecordIfRequired:^{}];  // this will be run again when return from login VC
    self.delegate = self;
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.loginManager = [ParseLoginManager new];
    [self.loginManager presentLoginScreenFromRootVCsViewDidAppear:self];

}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController
{

    // tell view controller corresponding tab selected
    id<TabBarItemSelected>selectedVC = (id)viewController;

    if([selectedVC isKindOfClass:[UINavigationController class]]){

        selectedVC = (id)[(UINavigationController *)selectedVC topViewController];

    }

    [selectedVC tabBarItemWasSelected];

}


@end
