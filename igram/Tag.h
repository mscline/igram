//
//  Tags.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>

@interface Tag : PFObject <PFSubclassing>

  @property NSString *photoID;
  @property NSString *tagName;

@end
