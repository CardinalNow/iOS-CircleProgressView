//
//  CircleProgressView.h
//  CircleProgressView
//
//  Created by Eric Rolf on 4/3/15.
//  Copyright (c) 2015 Eric Rolf. All rights reserved.
//

@import UIKit;
@import QuartzCore;

IB_DESIGNABLE

@interface CircleProgressView : UIView

@property (nonatomic, readwrite)    IBInspectable   double progress;
@property (nonatomic, readwrite)    IBInspectable   BOOL clockwise;
@property (nonatomic, readwrite)    IBInspectable   CGFloat trackWidth;
@property (nonatomic, strong)       IBInspectable   UIImage *trackImage;
@property (nonatomic, strong)       IBInspectable   UIColor *trackBackgroundColor;
@property (nonatomic, strong)       IBInspectable   UIColor *trackFillColor;
@property (nonatomic, strong)       IBInspectable   UIColor *trackBorderColor;
@property (nonatomic, readwrite)    IBInspectable   CGFloat trackBorderWidth;
@property (nonatomic, strong)       IBInspectable   UIColor *centerFillColor;
@property (nonatomic, strong)       IBInspectable   UIImage *centerImage;

@property (nonatomic, strong)                       UIView *contentView;

- (void)setProgress:(double)progress animated:(BOOL)animated;
@end
