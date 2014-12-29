//
//  TabBarViewController.h
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabBarItemSelected <NSObject>

  -(void)tabBarItemWasSelected; 

@end

@interface TabBarViewController : UITabBarController

@end
