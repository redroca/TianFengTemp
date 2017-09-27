//
//  FFPagingHeaderView.m
//  BasicFrameworkManager
//
//  Created by Fan on 16/9/27.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import "FFPagingHeaderView.h"
#import "FFPagingViewItem.h"

#define kDefaultItemWidth       60.0f
#define KDefaultLineColor       [UIColor colorWithRed:234/255.0f green:237/255.0f blue:240/255.0f alpha:1];


#define kDefaultTextColor       [UIColor blackColor]
#define kDefaultSelectTextColor [UIColor colorWithRed:1.00f green:0.49f blue:0.65f alpha:1.00f]

#define kLineHeight             (1 / [UIScreen mainScreen].scale)
#define kDefaultFont            [UIFont systemFontOfSize:17.0]

@interface FFPagingHeaderView () <UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollview;
@property(nonatomic, strong) CALayer *lineLayer;
@property(nonatomic, strong) CALayer *itemLineLayer;

@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation FFPagingHeaderView
- (instancetype)init
{
    if (self == [super init]) {
        _itemWidth = kDefaultItemWidth;
        _lineColor = KDefaultLineColor;
        _font = kDefaultFont;
        _textColor = kDefaultTextColor;
        _selectTextColor = kDefaultSelectTextColor;
        _scale = false;
        
        _itemCanScroll = YES;       ///< 默认可以滚动
        _showItemLine = YES;        ///< 默认显示底部线
        _itemLinePosition = FFPagingViewItemLineBottom;     ///<    默认显示在底部
        _itemLineWidth = kDefaultItemWidth;
        _itemLineColor = [UIColor redColor];
    }
    return self;
}

- (void)updateTitleContentOffset:(NSInteger)index
{
    FFPagingViewItem *item = (FFPagingViewItem *)[self.scrollview viewWithTag:index+1];
    float offsetX = (item.center.x - self.scrollview.frame.size.width/2.0) > 0 ? (item.center.x - self.scrollview.frame.size.width/2.0) : 0;
    float maxOffsetX = self.scrollview.contentSize.width - self.scrollview.frame.size.width;
    if (offsetX < maxOffsetX) {
        [self.scrollview setContentOffset:CGPointMake(offsetX, 0) animated:true];
    } else {
        [self.scrollview setContentOffset:CGPointMake(maxOffsetX, 0) animated:true];
    }
}

- (void)reloadData {
    for (UIView *view in self.scrollview.subviews) {
        if ([view isKindOfClass:[FFPagingViewItem class]]) {
            FFPagingViewItem *item = (FFPagingViewItem *)view;
            [item setTitleColor:_textColor forState:UIControlStateNormal];
            [item setTitleColor:_selectTextColor forState:UIControlStateSelected];
        }
    }
}

#pragma mark - response Action
- (void)tapGesture:(UIButton *)btn {
    for (UIView *view in self.scrollview.subviews) {
        if ([view isKindOfClass:[FFPagingViewItem class]]) {
            FFPagingViewItem *item = (FFPagingViewItem *)view;
            item.selected = NO;
        }
    }
    btn.selected = YES;
    
    if (self.pagingViewItemClickHandle) {
        self.pagingViewItemClickHandle(self, btn.titleLabel.text, btn.tag - 1);
    }
    self.currentIndex = btn.tag - 1;
    
    [self updateTitleContentOffset:self.currentIndex];
}

#pragma mark - setter
- (void)setItemWidth:(CGFloat)itemWidth
{
    _itemWidth = itemWidth;
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    [self reloadData];
}

- (void)setSelectTextColor:(UIColor *)selectTextColor
{
    _selectTextColor = selectTextColor;
    [self reloadData];
}

- (void)setScale:(BOOL)scale
{
    _scale = scale;
}

- (void)setItemLineColor:(UIColor *)itemLineColor
{
    _itemLineColor = itemLineColor;
}

- (void)setItemLineWidth:(CGFloat)itemLineWidth
{
    _itemLineWidth = itemLineWidth;
}

- (void)setItemLinePosition:(FFPagingViewItemLinePosition)itemLinePosition
{
    _itemLinePosition = itemLinePosition;
}

- (void)setShowItemLine:(BOOL)showItemLine
{
    _showItemLine = showItemLine;
}

- (void)setItemCanScroll:(BOOL)itemCanScroll {
    _itemCanScroll = itemCanScroll;
}

- (void)setTitles:(NSArray<NSString *> *)titles
{
    _titles = titles;
    
    self.scrollview.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - kLineHeight);
    self.scrollview.contentSize = CGSizeMake(titles.count * self.itemWidth, self.frame.size.height - kLineHeight);
    
    if (titles.count) {
        for (NSInteger i=0; i<titles.count; i++) {
            FFPagingViewItem *item = [[FFPagingViewItem alloc] init];
            [self.scrollview addSubview:item];
            
            //当自定义宽度小于平分title的宽度时，使用根据屏幕宽度进行等分宽度
            CGFloat width = self.scrollview.bounds.size.width / titles.count;
            if (self.itemWidth <= width) {
                self.itemWidth = width;
            }
            
            item.frame = CGRectMake(i * self.itemWidth, 0, self.itemWidth, self.bounds.size.height);
            if (i == 0 && self.scale) {
                item.transform = CGAffineTransformMakeScale(1.3, 1.3);
                
                float x = item.center.x - self.itemLineWidth/2.0;
                
                if (self.showItemLine) {
                    if (self.itemLinePosition == FFPagingViewItemLineTop) {
                        self.itemLineLayer.frame = CGRectMake(x, 0, self.itemLineWidth, 2);
                    } else {
                        self.itemLineLayer.frame = CGRectMake(x, self.scrollview.bounds.size.height - 2, self.itemLineWidth, 2);
                    }
                }
            }
            
            [item setTitle:titles[i] forState:UIControlStateNormal];
            item.titleLabel.font = self.font;
            [item setTitleColor:self.textColor forState:UIControlStateNormal];
            [item setTitleColor:self.selectTextColor forState:UIControlStateSelected];
            if (!i) {
                item.selected = YES;
            }
            item.tag = i + 1;
//            [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)]];
            [item addTarget:self action:@selector(tapGesture:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    self.lineLayer.frame = CGRectMake(0, self.scrollview.bounds.size.height, self.scrollview.bounds.size.width, kLineHeight);
    self.scrollview.contentSize = CGSizeMake(titles.count * self.itemWidth, self.frame.size.height - kLineHeight);
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    _contentOffset = contentOffset;
    CGFloat offsetX = contentOffset.x;
    
    //当前索引
    NSInteger index = offsetX / [[UIScreen mainScreen] bounds].size.width;
    
    FFPagingViewItem *leftItem = (FFPagingViewItem *)[self.scrollview viewWithTag:index + 1];
    FFPagingViewItem *rightItem = (FFPagingViewItem *)[self.scrollview viewWithTag:index + 2];
    
    //修改下划线的frame
    if (self.showItemLine) {
        float x = leftItem.center.x - self.itemLineWidth/2.0;
        if (self.itemLinePosition == FFPagingViewItemLineTop) {
            self.itemLineLayer.frame = CGRectMake(x, 0, self.itemLineWidth, 2);
        } else {
            self.itemLineLayer.frame = CGRectMake(x, self.scrollview.bounds.size.height - 2, self.itemLineWidth, 2);
        }
    }
    
    self.currentIndex = index;
}

#pragma mark - getter
- (UIScrollView *)scrollview
{
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] init];
        _scrollview.delegate = self;
        _scrollview.showsVerticalScrollIndicator = false;
        _scrollview.showsHorizontalScrollIndicator = false;
        [self addSubview:_scrollview];
    }
    return _scrollview;
}

- (CALayer *)lineLayer
{
    if (!_lineLayer) {
        _lineLayer = [CALayer layer];
        [self.layer addSublayer:_lineLayer];
        _lineLayer.backgroundColor = self.lineColor.CGColor;
    }
    return _lineLayer;
}

- (CALayer *)itemLineLayer
{
    if (!_itemLineLayer) {
        _itemLineLayer = [CALayer layer];
        if (self.showItemLine) {
            [self.scrollview.layer addSublayer:_itemLineLayer];
        }
        _itemLineLayer.backgroundColor = self.itemLineColor.CGColor;
    }
    return _itemLineLayer;
}
@end
