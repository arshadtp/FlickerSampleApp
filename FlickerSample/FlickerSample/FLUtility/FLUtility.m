//
//  FLUtility.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLUtility.h"
#import "Constants.h"

@implementation FLUtility

+ (NSString *) getJSONStringFromFlickerResponseString:(NSString *) responseString {
	
	NSString *trimedResponseString =[responseString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:JSON_FLICKR_FEED]];
	
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
