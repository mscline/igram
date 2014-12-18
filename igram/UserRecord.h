//
//  Users.h
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>


// parse will create a PFUser when you login, but we don't want to work with their stuff
// so we create our own UserRecord
// call createNewUserRecordIfRequired from your ViewDidLoad

// to add properties to your UserRecord, subclass UserRecord (this class)


typedef void(^Block)();

@interface UserRecord : PFObject <PFSubclassing>

  @property PFUser *parseUser;

  +(void)createNewUserRecordIfRequired:(Block)runBlock;  
  +(UserRecord *)returnOurUsersID;

@end
