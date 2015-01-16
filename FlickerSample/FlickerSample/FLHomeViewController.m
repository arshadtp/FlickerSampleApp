//
//  ViewController.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLHomeViewController.h"

@interface FLHomeViewController ()

@end

@implementation FLHomeViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Collection view delegate  methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *identifier = @"PhotoCell";
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	if (!cell) {
		
	}
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	CGSize size = [UIScreen mainScreen].bounds.size;
	CGFloat height = (size.height-20-40)/4;
	return CGSizeMake(height, height);
}

- (void) traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
	
	if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
		/* Hide the extra details */
		self.view.layoutMargins = UIEdgeInsetsMake(10, 100, 10, 40);
		[self.view layoutIfNeeded];

	} else if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
		/* Show the extra details */
		self.view.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
		[self.view layoutIfNeeded];

	}
}

- (void) setMarging {
	
}
@end
