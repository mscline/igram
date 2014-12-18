//
//  ParseLogin.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParseLoginManager : NSObject 


  +(void)setupParseInAppDelegateWithAppID:(NSString *)appId clientKey:(NSString *)key forApplication:(UIApplication *)application;

  -(void)presentLoginScreenFromRootVCsViewDidAppear:(UIViewController *)vc;
        // rem: when you create a ParseLogin object, you will need to keep it around to handle the delegate calls


@end

// using test login test / test

// UPGRADE: facebook integration
// for customized appearance, see https://parse.com/tutorials/login-and-signup-views
