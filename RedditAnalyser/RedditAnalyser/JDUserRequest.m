//
//  JDUserRequest.m
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "JDUserRequest.h"

@implementation JDUserRequest

-(BOOL)loadUser:(NSString *)userName{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.reddit.com/reddits/"]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self startConnectionForRequest:request];
    
    return YES;
}

-(void)requestSuccess:(NSData *)responseBody{
    NSError *error = nil;
    NSArray *result = [NSJSONSerialization JSONObjectWithData:responseBody options:0 error:&error];
    
    if(error != nil){
        [self.delegate request:self failedWithError:[error description] andBody:responseBody];
        return;
    }
    
    for(NSDictionary *jmanual in result){
    }
    
    [self.delegate requestSuccess:self];
}

@end
