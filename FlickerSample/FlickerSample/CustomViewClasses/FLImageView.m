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

- (void)loadImage:(FLImage *)image withPlaceholderImage:(UIImage *)placeHolderImage {
	
	[self setImage:placeHolderImage];
    [[FSImageLoader sharedInstance] loadImageForURL:image.url image:^(UIImage *loadedImage, NSError *error) {
		
        if (loadedImage) {
			image.image = loadedImage;
            [self setImage:image.image];
        }
    }];
}

- (void)loadImage:(FLImage *)image withPlaceholderImage:(UIImage *)placeHolderImage andWithSuccessBlock:(loadImageSuccessBlock) successBlock {
	
	[[FSImageLoader sharedInstance] loadImageForURL:image.url image:^(UIImage *loadedImage, NSError *error) {
		
		if (loadedImage) {
			
			image.image = loadedImage;
			[self setImage:image.image];
		}
		successBlock(image, error);
    }];
	
}


+ (void) cancellAllImageDownLoads {
	
	[[FSImageLoader sharedInstance] cancelAllRequests];
}
@end
