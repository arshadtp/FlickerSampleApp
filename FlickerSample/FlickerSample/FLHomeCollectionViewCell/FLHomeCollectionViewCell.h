//
//  FLHomeCollectionViewCell.h
//  FlickerSample
//
//  Created by Arshad T P on 1/16/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLImageView.h"

@interface FLHomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet FLImageView *imageView;

/**
 *  Load data in to colection view cell
 *
 *  @param image FLImage obj which contains URL of teh image to be loaded
 */
- (void) loadData:(FLImage *) image;
@end
