//
//  Comments.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>

@interface Comment : PFObject <PFSubclassing>

  @property NSString *rePhoto;
  @property NSString *byUser;
  @property NSString *onDate;
  @property NSString *commentText;

@end
