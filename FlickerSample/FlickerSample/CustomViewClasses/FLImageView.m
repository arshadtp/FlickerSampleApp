//
//  FLImageView.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLImageView.h"
#import "FSImageLoader.h"

@implementation FLImageView

- (id)initWithFrame:(CGRect)frame {
	
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)loadImageForUrl:(NSURL *)url {
	
	self.imageURL = url;
    [[FSImageLoader sharedInstance] loadImageForURL:url image:^(UIImage *image, NSError *error) {
		
        if (image) {
			
            [self setImage:image];
        }
    }];
}

- (void)loadImageForUrl:(NSURL *)url withSuccessBlock:(loadImageSuccessBlock) successBlock {
	
	self.imageURL = url;
	[[FSImageLoader sharedInstance] loadImageForURL:url image:^(UIImage *image, NSError *error) {
		
		if (image) {
			
			[self setImage:image];
		}
		successBlock(image, error);
    }];
	
}

+(BOOL) compareImageView:(FLImageView *) firstImageView and:(FLImageView *) secondImageView {
	
	if ([firstImageView.imageURL isEqual:secondImageView.imageURL]) {
		return YES;
	}
	return NO;
}

@end
