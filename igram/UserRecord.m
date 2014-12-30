//
//  Users.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "UserRecord.h"
#import "PhotoPickerCode.h"

@implementation UserRecord
  @dynamic parseUser, userPhoto;


#pragma CLASS VARIABLES

UserRecord *ourUser;
Block completionBlock;  // for when add user for the first time


#pragma Create New User

+(void)createNewUserRecordIfRequired:(Block)runBlock
{

    // check to see if already have our UserRecord
    if(ourUser){ return;}

    // check to see if login completed (ie, parse knows who the user is), if not return
    if(![PFUser currentUser]){ return; };

    
    // save block
    completionBlock = runBlock;

    // run steps 1, 2, & 3
    [self part1_checkToSeeIfUserHasEntryInDB];

}

+(void)part1_checkToSeeIfUserHasEntryInDB
{

    // check to see if have entry in db
    // and continue

    PFQuery *query = [UserRecord query];
    [query whereKey:@"parseUser" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        if(error){ NSLog(@"%@", error); }
        [self part2_addNewUserToDBIfRequired:objects];
        
    }];

}

+(void)part2_addNewUserToDBIfRequired:(NSArray *)objects
{
    // if DB found a User Record, store it and exit
    if(objects.count != 0){

        ourUser = (UserRecord *)objects[0];
        return;

    }

    // if not, create one
    UserRecord *theUser = [UserRecord object];
    theUser.parseUser = (PFUser *)[PFUser currentUser];
    [theUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        if(error){ NSLog(@"erorr %@", error); return; }

        ourUser = theUser;
        [self part3_runCompletionBlock];

    }];

}

+(void)part3_runCompletionBlock
{

    completionBlock();

}



#pragma mark Other

+(UserRecord *)returnOurUsersUserObject
{

    return ourUser;
    
}

-(void)addPhotoToUser:(UIImage *)image completionBlock:(void(^)(NSError *error))completionBlock
{

    self.userPhoto = [PhotoPickerCode createPFFileForImage:image];
    [self saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock(error);

    }];

}

#pragma mark PFObject Protocol Methods

+(NSString *)parseClassName
{

    return @"UserRecord";

}

+(void)load
{

    [self registerSubclass];
    
}


@end
