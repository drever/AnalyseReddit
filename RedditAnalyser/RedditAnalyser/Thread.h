//
//  Thread.h
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Thread : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * url;

@end
