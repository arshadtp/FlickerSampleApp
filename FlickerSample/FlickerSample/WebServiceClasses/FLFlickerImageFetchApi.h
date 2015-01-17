//
//  FLFlickerImageFetchApi.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15.15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLBaseWebService.h"

typedef void (^flickerImageFetchWevServicetSuccessBlock)(NSMutableArray *imageURLArray);
typedef void (^flickerImageFetchWevServiceFailureBlock)(NSError *error);


@interface FLFlickerImageFetchApi : FLBaseWebService

/**
 *  Method to fetch image from flicker public image API
 *
 *  @param  tags tags to be searched
 *  @param successBlock success call back block
 *  @param failureBlock failure call back block
 *  @param cachePolicy  request cache policy
 */
- (void) getFlickerImagesWithTag:(NSString *)tags andServiceSuccessBlock:(flickerImageFetchWevServicetSuccessBlock)successBlock andFailureBlock:(flickerImageFetchWevServiceFailureBlock)failureBlock andCachePolicy:(NSURLRequestCachePolicy) cachePolicy;

@end
