//
//  JDListingRequest.m
//  RedditAnalyser
//
//  Created by Johannes Drever on 11/18/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import "JDSubredditsRequest.h"
#import "Subreddit.h"

@implementation JDSubredditsRequest

-(BOOL)loadSubreddits{
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
    
    for(NSDictionary *t in [[result valueForKey:@"data"] valueForKey:@"children"]){
        NSDictionary *subredditJSON = [t valueForKey:@"data"];
        
        Subreddit *s = [NSEntityDescription insertNewObjectForEntityForName:@"Subreddit" inManagedObjectContext:self.managedObjectContext];
        
        s.name = [subredditJSON valueForKey:@"name"];
        s.displayName = [subredditJSON valueForKey:@"display_name"];
        s.headerTitle = [subredditJSON valueForKey:@"headerTitle"];
        s.over18 = [subredditJSON valueForKey:@"ober18"];
//        s.headerImg = [subredditJSON valueForKey:@"header_img"];
        s.url = [subredditJSON valueForKey:@"url"];
        s.srDescription = [subredditJSON valueForKey:@"description"];
        s.created = [NSDate dateWithTimeIntervalSince1970:[[subredditJSON valueForKey:@"created"] intValue]];
        s.subscripers = [subredditJSON valueForKey:@""];
        s.publicDescription = [subredditJSON valueForKey:@"publicDescription"];
        s.id = [subredditJSON valueForKey:@"id"];

    }
    
    [self.delegate requestSuccess:self];
}


@end
