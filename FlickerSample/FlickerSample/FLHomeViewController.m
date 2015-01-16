//
//  ViewController.m
//  FlickerSample
//
//  Created by Arshad T P on 1/15/15.
//  Copyright (c) 2015 Ab'initio. All rights reserved.
//

#import "FLHomeViewController.h"
#import "SVProgressHUD.h"
#import "FLImage.h"

@interface FLHomeViewController () {
	NSString *searchText;
}

@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation FLHomeViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	[self hideOrShowNoResultLabel];
	[self configireSearchField];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self loadImages];

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	[self cancelAllImageDownLoads];
	// Dispose of any resources that can be recreated.
}

- (void) dealloc {
	
	[self cancelAllImageDownLoads];
	
}

#pragma mark - Collection view delegate  methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return _imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *identifier = @"PhotoCell";
	FLHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	FLImage *iConImage = [_imageArray objectAtIndex:indexPath.row];
	if (!iConImage.image) {
		
		if (self.photoCollectionView.dragging == NO && self.photoCollectionView.decelerating == NO) {
			[cell.imageView loadImage:iConImage withPlaceholderImage:[UIImage imageNamed:@"PageControlNoImage"]];
		}
	} else {
		cell.imageView.image = iConImage.image;
	}

	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	CGSize size = [UIScreen mainScreen].bounds.size;
	CGFloat height = (size.height-20-40)/4;
	return CGSizeMake(height, height);
}


#pragma mark - Table cell image support


/**
 *  Method to download image for a perticular index path
 *
 *  @param iConImage FLImage object which contains url
 *  @param indexPath indexpath of cell to which image is to be downloaded
 */
- (void)startIconDownload:(FLImage *)iConImage forIndexPath:(NSIndexPath *)indexPath
{
	FLHomeCollectionViewCell *cell = (FLHomeCollectionViewCell *)[self.photoCollectionView cellForItemAtIndexPath:indexPath];
	[cell.imageView loadImage:iConImage withPlaceholderImage:[UIImage imageNamed:@"PageControlNoImage"]];
}

/**
 *  This method is used in case the user scrolled into a set of cells that don't have their app icons yet
 */
- (void)loadImagesForOnscreenRows
{
	if (_imageArray.count > 0)
	{
		NSArray *visiblePaths = [self.photoCollectionView indexPathsForVisibleItems];
		for (NSIndexPath *indexPath in visiblePaths)
		{
			FLImage *iConImage = (_imageArray)[indexPath.row];
			
			if (!iConImage.image)
				// Avoid the app icon download if the app already has an icon
			{
				[self startIconDownload:iConImage forIndexPath:indexPath];
			}
		}
	}
}

/**
 *  Method cancel all the image load requests
 */
- (void) cancelAllImageDownLoads {
	
	[FLImageView cancellAllImageDownLoads];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	//Load images for all onscreen rows when scrolling is finished.
	if (!decelerate)
	{
		[self loadImagesForOnscreenRows];
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	// When scrolling stops, proceed to load the app icons that are on screen.
	[self loadImagesForOnscreenRows];
}

#pragma Mark - Search view Delegate

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self loadImages];
	[_searchField resignFirstResponder];
	searchText = searchBar.text;

}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	[_searchField resignFirstResponder];
	
	// if user cleared the search text then reload the data
	if (searchText && (searchText.length > 0)) {
		if (searchBar.text.length == 0 ) {
			[self loadImages];
		}
	}
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	NSLog(@"fdssd" );
}
#pragma Mark - Webservice call
- (void) loadImages {
	
	[SVProgressHUD show];
	if (!_webservice) {
		_webservice = [[FLFlickerImageFetchApi alloc] init];
	} else {
		[_webservice cancelAllRequests];
	}
	[_webservice getFlickerImagesWithTag:_searchField.text andServiceSuccessBlock:^(NSMutableArray *imageURLArray) {
		[SVProgressHUD dismiss];
		// Cancel image loading requesrts
		[self cancelAllImageDownLoads];
		_imageArray = imageURLArray;
		[_photoCollectionView reloadData];
		[self hideOrShowNoResultLabel];
		
	} andFailureBlock:^(NSError *error) {
		[SVProgressHUD dismiss];
		
	} andCachePolicy:NSURLRequestReturnCacheDataElseLoad];
}


#pragma Mark - Other

/**
 *  Methid hide or show the label based on whether the is a non zero search result or not
 */
- (void) hideOrShowNoResultLabel {
	
	if (_imageArray.count == 0) {
		
		_noResultFoundLabel.hidden = NO;
	} else{
		_noResultFoundLabel.hidden = YES;
	
	}
}

- (void) configireSearchField{
	
	if (_searchField) {
		_searchField.showsCancelButton = YES;
	}
}
@end
