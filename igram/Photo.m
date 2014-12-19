//
//  Photos.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "Photo.h"

@implementation Photo
  @dynamic tags, byUser, imageFile, date, caption;
  @synthesize photoImage;


+(NSString *)parseClassName
{

    return @"Photo";

}

+(void)load
{

    [self registerSubclass];
    
}


#pragma Upload Photo

+(void)addPhoto:(UIImage *)image caption:(NSString *)caption completionBlock:(void(^)())completionBlock
{

    Photo *photo = [Photo object];
    photo.imageFile = [self createPFFileForImage:image];
    photo.caption = caption;
    photo.date = [NSDate date];

    UserRecord *userRecord = [UserRecord returnOurUsersUserObject];
    photo.byUser = userRecord;  // MUST DO IN 2 STEPS!!!

    [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        completionBlock();

    }];
    

}

+(void)addTags:(NSArray *)arry forPhoto:(Photo *)photo
{

}


+(PFFile *)createPFFileForImage:(UIImage *)image
{

    NSData *imageData = UIImagePNGRepresentation(image);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];

    return imageFile;

}


#pragma mark Download Photos

+(void)downloadPhotosWithCompletionBlock:(void(^)(NSArray *objects))completionBlock
{

    PFQuery *query = [self query];
    //[query whereKey:<#(NSString *)#> equalTo:<#(id)#>]
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        completionBlock(objects);

    }];
    
}

-(void)downloadImageAndUpdateImageView:(UIImageView *)view forIndexPath:(NSIndexPath *)indexPath
{

    // save index so can exit if cell is reused for different index path
    int path = [self uniqueIntForIndexPath:indexPath];
    view.tag = path;

    // request data
    PFFile *userImageFile = self.imageFile;
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {


        // check to make sure cell not reused
        if(path != view.tag){ return; }

        view.image = [UIImage imageWithData:imageData];
        
    }];

}

-(int)uniqueIntForIndexPath:(NSIndexPath *)indexPath
{

    return (int)indexPath.section * 10000000 + (int)indexPath.row;

}




@end
