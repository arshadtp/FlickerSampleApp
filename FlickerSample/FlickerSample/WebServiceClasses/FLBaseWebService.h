//
//  FLBaseWebService.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define HTTPPOST @"POST"
#define HTTPGET @"GET"

typedef void (^baseWebserviceSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^baseWebseriveFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface FLBaseWebService : NSObject {
	
	NSString *requestMethod;
    NSDictionary *parameters;
    NSString *webserviceMethod;
    NSString *contentType;
	NSString *contentLength;
	NSString *baseURL;
	NSURLRequestCachePolicy cachePolicy;
}

- (void)makeRequestWithWebserviceSuccessBlock:(baseWebserviceSuccessBlock)successBlock
                              andFailureBlock:(baseWebseriveFailureBlock)failureBlock;

@end
