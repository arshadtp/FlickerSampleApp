//
//  FLBaseWebService.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLBaseWebService.h"
#import "Constants.h"

#define ACCEPTABLE_CONTENT_TYPES @"application/x-javascript",@"text/plain",@"application/octet-stream",@"application/json"
@interface FLBaseWebService ()

{
	AFHTTPRequestOperationManager *manager;
}
@end

@implementation FLBaseWebService

- (void)makeRequestWithWebserviceSuccessBlock:(baseWebserviceSuccessBlock)successBlock
								 andFailureBlock:(baseWebseriveFailureBlock)failureBlock {
	
	if (baseURL.length == 0) {
		
		baseURL = FLICKER_BASE_URL;
	}
	
	NSString  *serviceUrlString = [NSString stringWithFormat:@"%@%@",baseURL,webserviceMethod];
	serviceUrlString = [serviceUrlString stringByAddingPercentEscapesUsingEncoding:
						NSASCIIStringEncoding];
	
	NSError *error;
	
	NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:requestMethod URLString:serviceUrlString parameters:parameters error:&error];
	request.cachePolicy = cachePolicy;
	
	AFHTTPRequestOperation *operation;
	operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	
	operation.responseSerializer = [AFCompoundResponseSerializer serializer];
	operation.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:ACCEPTABLE_CONTENT_TYPES,nil];
	[operation setCompletionBlockWithSuccess:successBlock
                                     failure:failureBlock];
    
	[[AFHTTPRequestOperationManager manager].operationQueue addOperation:operation];
}

- (void) cancelAllRequests {
	
	[[AFHTTPRequestOperationManager manager].operationQueue cancelAllOperations];

}

@end
