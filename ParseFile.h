//
//  SharedFile.h
//  igram
//
//  Created by xcode on 12/21/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Parse/Parse.h>

@interface ParseFile : PFObject <PFSubclassing>

  @property NSString *name;
  @property NSString *typeID;
  @property NSDate *date;

  @property PFFile *theDataFile;


  +(void)makeListOfFilesOnServer:(NSString *)typeID_stringOrNil afterDate:(NSDate *)date withCompletionBlock:(void(^)(NSError *error, NSArray *objects))completionBlock;
  +(void)downloadFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *theData))completionBlock;


  +(void)uploadFileWithName:(NSString *)name typeIdentifier:(NSString *)typeIdentifier date:(NSDate *)date completionBlock:(void(^)(NSError *error))completionBlock;
  +(void)deleteFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *theData))completionBlock;

@end
