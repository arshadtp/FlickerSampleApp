//
//  FLUtility.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import <UIKit/UIKit.h>

@interface FLUtility : NSObject


/**
 *   functin will show an alert message with a title and a message.
 
 *   @param title (NSString) - Title for the alert view.
 *   @param message (NSString) - message to be shown in the alert body.
 *   @param actions (NSArray) - Array of UIAlertAction objects.
 *   @param controller (UIViewController) - viewController object which alertview need to be displayed.
 
 *   @return void
 
 */
+ (void)showAlertWithTitle:(NSString *)title
				   message:(NSString *)message
				   actions:(NSArray *)actions
		  inViewController:(UIViewController *)controller;
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
