//
//  SharedFile.m
//  igram
//
//  Created by xcode on 12/21/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "ParseFile.h"

@implementation ParseFile
  @dynamic name, typeID, date, theDataFile;


#pragma mark UPLOADING FILES

+(void)makeListOfFilesOnServer:(NSString *)typeID_stringOrNil afterDate:(NSDate *)date withCompletionBlock:(void(^)(NSError *error, NSArray *objects))completionBlock
{

    // get list of file from db

    PFQuery *query = [ParseFile query];

    if(typeID_stringOrNil){

        [query whereKey:@"typeID" equalTo:typeID_stringOrNil];
    }

    if(date){

        #warning UNTESTED
        [query whereKey:@"date" greaterThan:date];

    }

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        completionBlock(error, objects);

    }];
    
}

+(void)uploadFileWithName:(NSString *)name typeIdentifier:(NSString *)typeIdentifier date:(NSDate *)date completionBlock:(void(^)(NSError *error))completionBlock
{
    ParseFile *fileToUpload = [ParseFile object];
    fileToUpload.name = name;
    fileToUpload.typeID = typeIdentifier;
    fileToUpload.date = date;

    [fileToUpload saveEventually:^(BOOL succeeded, NSError *error) {

        completionBlock(error);

    }];

}

+(void)downloadFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *someData))completionBlock
{

    // request data
    PFFile *fileX; //self.theDataFile;
    [fileX getDataInBackgroundWithBlock:^(NSData *rawData, NSError *error) {

        completionBlock(error, rawData);

    }];

}

+(void)deleteFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *theData))completionBlock
{}

#pragma mark PFObject Protocol Methods

+(NSString *)parseClassName
{

    return @"ParseFile";

}

+(void)load
{

    [self registerSubclass];
    
}

@end
