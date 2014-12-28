//
//  LocalFiles.h
//  igram
//
//  Created by xcode on 12/23/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {invalid, notDownloaded, downloaded, skipDownload}State;

@interface LocalFile : NSObject <NSCoding>

  @property NSString *name;             // for user to know what it is
  @property NSString *fileIDNumber;     // unique identifier used to save
  @property NSString *typeID;           // can group types of files
  @property NSDate *date;
  @property State downloadState;        // see enum (above)

  // the data file will be stored to disk, use methods to retrieve


@end
