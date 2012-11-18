//
//  LIServerRequestDelegate.h
//  Lucky33
//
//  Created by Johannes Drever on 11/14/12.
//  Copyright (c) 2012 Linova. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDServerRequest;
@protocol JDServerRequestDelegate <NSObject>

- (void)requestSuccess:(JDServerRequest*)request;
- (void)request:(JDServerRequest*)request failedWithError:(NSString*)error andBody:(NSData*)body;
- (void)requestCancelled:(JDServerRequest*)request;

@end


@interface JDServerRequest : NSObject

@property NSManagedObjectContext *managedObjectContext;

@property (weak, readonly) id<JDServerRequestDelegate> delegate;

- (id)initWithDelegate:(id<JDServerRequestDelegate>)delegate;

@end

@interface JDServerRequest (SubclassProtected)

- (void)startConnectionForRequest:(NSURLRequest*)request;

@end

@interface JDServerRequest (SubclassAbstract)

- (void)requestSuccess:(NSData*)responseBody;

@end
