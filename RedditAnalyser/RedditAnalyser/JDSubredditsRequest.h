//
//  JDListingRequest.h
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "JDServerRequest.h"

@interface JDSubredditsRequest : JDServerRequest

-(BOOL)loadSubreddits;
@end
