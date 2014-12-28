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


  +(void)downloadFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *theData))completionBlock;
  +(void)uploadFileWithName:(NSString *)name typeIdentifier:(NSString *)typeIdentifier date:(NSDate *)date completionBlock:(void(^)(NSError *error))completionBlock;



  //+(void)deleteFile:(NSString *)string withCompletionBlock:(void(^)(NSError *error, NSData *theData))completionBlock;  // no easy way to do it

  // in general, just use caching (unless want user to be able to opt out)
  +(void)makeListOfFilesOnServer:(NSString *)typeID_stringOrNil afterDate:(NSDate *)date withCompletionBlock:(void(^)(NSError *error, NSArray *objects))completionBlock;

@end


/*

 LOCAL DATA STORE
 store objects offline (as if in different db, so query differently)
 to save in local store, use [myFPObject pinInBackground]
 
 FOR REGULAR DATA
 if save eventually, data will be temporarily stored locally until save completes

 the difficulty here, appears that we are using a different set of calls for local and remote dbs
but it is easy enough, just add 
 
 [query fromLocalDatastore]; (this just sets the property)
 [[query findObjectsInBackground] continueWithBlock:^id(BFTask *task) {
 
 https://parse.com/docs/ios_guide#objects-pinning/iOS
 
 

 PFFile
 wrapper around serialized data (eg, NSData)

 + (id) fileWith...	// init
 – getDataInBackgroundWithBlock:progressBlock:
 Parameters
 resultBlock
 The block should have the following argument signature: (NSData result, NSError error)

 progressBlock
 The block should have the following argument signature: (int percentDone)

 Discussion
 This method will execute the progressBlock periodically with the percent progress. progressBlock will get called with 100 before resultBlock is called.

 - getData...
 - cancel 		// cancel data transfer

 -isDataAvailable // is it availbable in memory or does it need to be downloaded?

 -delete (a bit of a headache)




 If you were to use kPFCachePolicyCacheThenNetwork, your query would first return any cached results, followed by hitting the network to get the latest results from Parse. in which case the newly saved object would be returned as well.  // if know that data was changed you may just want to use the kPFCachePolicyNetworkOnly (a little upgrade)
 Parse simply caches the results of your queries. This is extremely limiting and not the same as caching all of your PFObjects. For example, say you ran a query for all of your "contacts" PFObjects. The only thing you would be able to do with the cache is run the exact same query again later (and get the exact same result). You couldn't even query for a subset of that cached data.

 Another issue is the cached objects will not be updated with any changes your user is making to your PFObjects. For example, say a user is editing contacts offline and your code is calling saveEventually to save those changes to Parse when possible. When you get a cached query result the user's changes will not be reflected in your PFObjects.

 [PFQuery clearAllCachedResults];

*/