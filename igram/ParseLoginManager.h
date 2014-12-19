//
//  ParseLogin.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParseLoginManager : NSObject 


  // step 1:
  +(void)setupParseInAppDelegateWithAppID:(NSString *)appId clientKey:(NSString *)key forApplication:(UIApplication *)application;

  // step 2: create a ParseLoginManager object (save as a property or will be dealloced) and run
  -(void)presentLoginScreenFromRootVCsViewDidAppear:(UIViewController *)vc;


@end

// using test login test / test

// UPGRADE: facebook integration
// for customized appearance, see https://parse.com/tutorials/login-and-signup-views
