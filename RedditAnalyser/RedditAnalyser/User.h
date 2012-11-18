//
//  User.h
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * hasMail;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSNumber * linkKarma;
@property (nonatomic, retain) NSNumber * commentKarma;
@property (nonatomic, retain) NSNumber * isGold;
@property (nonatomic, retain) NSString * isMod;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * hasModMail;

@end
