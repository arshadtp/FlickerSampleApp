//
//  FLUtility.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLUtility : NSObject

/**
 *  Method to trim unwanted charecters from the Flicker response to make it a valid JSON
 *
 *  Flicker response JSON is in the fromat 'jsonFlickrFeed({...valid json....})'. Method trims 'jsonFlickrFeed(' and ')' from the response
 *  @param responseString string which is to be trimmed
 *
 *  @return JSON string
 */
+ (NSString *) getJSONStringFromFlickerResponseString:(NSString *) responseString;

/**
 *  Create a custom NSErron
 *
 *  @return NSError
 */
+ (NSError *) getFlickerDataCorruptedError;
@end
