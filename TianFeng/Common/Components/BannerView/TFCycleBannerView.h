//
//  AlsCycleBannerView.h
//  AlsTravel
//
//  Created by Benjamin on 4/24/17.
//  Copyright © 2017 Cloud4Magic. All rights reserved.
//

#import <M4CoreFoundation.h>

@class TFCycleBannerView;

typedef void(^CompleteBlock)(void);

@protocol TFCycleBannerViewDataSource <NSObject>

@required
- (NSArray *)numberOfCycleBannerView:(TFCycleBannerView *)bannerView;
- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index;

@optional
- (UIImage *)placeHolderImageOfZeroBannerView;
//- (UIImage *)placeHolderImageOfBannerView:(AlsCycleBannerView *)bannerView atIndex:(NSUInteger)index;

@end

@protocol TFCycleBannerViewDelegate <NSObject>

@optional
- (void)cycleBannerView:(TFCycleBannerView *)bannerView didScrollToIndex:(NSUInteger)index;
- (void)cycleBannerView:(TFCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index;

@end


@interface TFCycleBannerView : CoreUIView

// Delegate and Datasource
@property (weak, nonatomic) IBOutlet id<TFCycleBannerViewDataSource> datasource;
@property (weak, nonatomic) IBOutlet id<TFCycleBannerViewDelegate> delegate;

@property (assign, nonatomic, getter = isContinuous) BOOL continuous;   // if YES, then bannerview will show like a carousel, default is NO
@property (assign, nonatomic) NSUInteger autoPlayTimeInterval;  // if autoPlayTimeInterval more than 0, the bannerView will autoplay with autoPlayTimeInterval value space, default is 0

- (void)reloadDataWithCompleteBlock:(CompleteBlock)competeBlock;
- (void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated;

@end
