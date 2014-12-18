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


@interface TabBarViewController ()

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
    
}


@end
