//
//  LocalFiles.m
//  igram
//
//  Created by xcode on 12/23/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "LocalFile.h"

@implementation LocalFile
  @synthesize name, typeID, date, downloadState, fileIDNumber;

-(id)initWithName:(NSString *)nameX typeId:(NSString *)typeIDX date:(NSDate *)dateX downloadState:(State)downloadStateX nsDataFile:(NSData *)theDataX fileIDNumber:(NSString *)fileID
{
    self = [super init];

    if(self){

        name = nameX;
        typeID = typeIDX;
        date = dateX;
        downloadState = downloadStateX;
        fileIDNumber = fileID;

        // save file
        [self saveToDisk:theDataX fileName:fileIDNumber];

    }

    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    if(self){

        name = [aDecoder decodeObjectForKey:@"name"];
        typeID = [aDecoder decodeObjectForKey:@"typeID"];
        date = [aDecoder decodeObjectForKey:@"date"];
        downloadState = [aDecoder decodeIntForKey:@"downloadState"];
        fileIDNumber = [aDecoder decodeObjectForKey:@"fileIDNumber"];

    }

    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeObject:typeID forKey:@"typeID"];
    [aCoder encodeObject:date forKey:@"date"];
    [aCoder encodeInt:downloadState forKey:@"downloadState"];
    [aCoder encodeObject:fileIDNumber forKey:@"fileIDNumber"];

}


#pragma FILE OPERATIONS

+(NSData *)loadFileWithName:(NSString *)idNum
{

    NSURL *filePathAndName = [LocalFile returnURLForFileNamed:idNum];
    return [NSData dataWithContentsOfURL:filePathAndName];

}

-(void)saveToDisk:(NSData *)file fileName:(NSString *)idNum
{

    NSURL *filePathAndName = [LocalFile returnURLForFileNamed:idNum];
    [file writeToURL:filePathAndName atomically:YES];

}

+(NSURL *)returnURLForFileNamed:(NSString *)uniqueName
{

    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSURL *documentDirectory = [[fileManger URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *localFileLoc = [documentDirectory URLByAppendingPathComponent:
                           uniqueName];

    NSLog(@"doc dir = %@", documentDirectory );

    return localFileLoc;
    
}

@end
