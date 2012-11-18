#import "JDServerRequest.h"

@interface JDServerRequest () <NSURLConnectionDataDelegate>

@property (weak) id<JDServerRequestDelegate> delegate;
@property (strong) NSURLConnection *connection;
@property (strong) NSMutableData *incomingData;
@end


@implementation JDServerRequest

- (id)initWithDelegate:(id<JDServerRequestDelegate>)delegate {
    if (delegate == nil)
        return nil;
    
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)startConnectionForRequest:(NSURLRequest*)request {
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (connection != self.connection)
        return;
    self.connection = nil;
    
    [self requestSuccess:[self.incomingData copy]];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (connection != self.connection)
        return;
    self.connection = nil;
    
    NSLog(@"Request %@ failed with error %@, body %@", self, error, [[NSString alloc] initWithData:self.incomingData encoding:NSUTF8StringEncoding]);
    
    [self.delegate request:self failedWithError:[error description] andBody:self.incomingData];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if (connection != self.connection)
        return;
    self.incomingData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (connection != self.connection)
        return;
    [self.incomingData appendData:data];
}
@end

