//
//  FLMacros.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15.15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#ifndef FlickerSample_FLMacros_h
#define FlickerSample_FLMacros_h


#define isDictionary(object)\
[object isKindOfClass:[NSDictionary class]]?YES:NO

// Check if valid array
#define isArray(object)\
[object isKindOfClass:[NSArray class]]?YES:NO

// Check if dictionary has a valid string for perticular Key
#define dictionaryHasValidString(dictionary,aKey)\
[[dictionary objectForKey:aKey] isEqual:[NSNull null]] ? NO : ![[dictionary objectForKey:aKey] isKindOfClass:[NSString class]] ? NO :((NSString *)[dictionary objectForKey:aKey]).length > 0 ?YES: NO

// Check if valid string
#define isString(object)\
[object isKindOfClass:[NSString class]]?YES:NO

#endif
