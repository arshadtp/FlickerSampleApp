//
//  FLUtility.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLUtility.h"

@implementation FLUtility


+ (void)showAlertWithTitle:(NSString *)title
				   message:(NSString *)message
				   actions:(NSArray *)actions
		  inViewController:(UIViewController *)controller {
	
	
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
																			 message:message
																	  preferredStyle:UIAlertControllerStyleAlert];
	for (UIAlertAction *action in actions) {
		[alertController addAction:action];
	}
	[controller presentViewController:alertController animated:YES completion:nil];

}

+ (NSString *) getJSONStringFromFlickerResponseString:(NSString *) responseString {
	
	NSString *trimedResponseString =[responseString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:JSON_FLICKR_FEED]];
	
	// Flickr API identify ' incorrectly an escape charecter so removing that
	trimedResponseString = [trimedResponseString stringByReplacingOccurrencesOfString:@"'" withString:@"/"];

	if (trimedResponseString.length >2) {
		NSString *trimedString =[trimedResponseString substringWithRange:NSMakeRange(1, [trimedResponseString length]-2)];
		return trimedString;
	}
	return trimedResponseString;
}

+ (NSError *) getFlickerDataCorruptedError {
	
	return [NSError errorWithDomain:@"Corrupted Data" code:333 userInfo:@{NSLocalizedDescriptionKey:@"Response data is not in correct format"}];
}


@end
