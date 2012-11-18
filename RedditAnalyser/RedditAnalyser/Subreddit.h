//
//  Subreddit.h
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Subreddit : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * displayName;
@property (nonatomic, retain) NSString * headerTitle;
@property (nonatomic, retain) NSNumber * over18;
@property (nonatomic, retain) NSString * headerImg;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * srDescription;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSNumber * subscripers;
@property (nonatomic, retain) NSString * publicDescription;
@property (nonatomic, retain) NSString * id;

@end
