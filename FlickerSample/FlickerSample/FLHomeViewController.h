//
//  ViewController.h
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLHomeCollectionViewCell.h"
#import "FLFlickerImageFetchApi.h"

@interface FLHomeViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) FLFlickerImageFetchApi *webservice;

@property (weak, nonatomic) IBOutlet UILabel *noResultFoundLabel;

@property (weak, nonatomic) IBOutlet UISearchBar *searchField;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@end

