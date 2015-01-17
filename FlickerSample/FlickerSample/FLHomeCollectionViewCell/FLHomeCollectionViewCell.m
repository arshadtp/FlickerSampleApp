//
//  FLHomeCollectionViewCell.m
//  FlickerSample
//
//  Created by Arshad T P on 1/16/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLHomeCollectionViewCell.h"
#import "Constants.h"

@implementation FLHomeCollectionViewCell

- (void) loadData:(FLImage *) image {
	
	[_imageView loadImage:image withPlaceholderImage:[UIImage imageNamed:PLACE_HOLDER_IMAGE]];
}

- (void) prepareForReuse {
	
	_imageView.image = [UIImage imageNamed:PLACE_HOLDER_IMAGE];
}
@end
