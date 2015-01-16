//
//  FLImageView.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FLImage.h"

typedef void(^loadImageSuccessBlock)(UIImage *image, NSError *error);

@interface FLImageView : UIImageView

+ (void) cancellAllImageDownLoads; 
/**
 *  method to load image from url
 *
 *  uses Ego cache if cached image
 *  @param url URL of the image which is to be loaded
 */

- (void)loadImage:(FLImage *)image withPlaceholderImage:(UIImage *)image;
/**
 *  method to load image from url with a callback method
 *
 *  uses Ego cache if cached image
 *  @param url          url URL of the image which is to be loaded
 *  @param successBlock success call back method
 */

- (void)loadImage:(FLImage *)image withPlaceholderImage:(UIImage *)image andWithSuccessBlock:(loadImageSuccessBlock) successBlock;

@end
