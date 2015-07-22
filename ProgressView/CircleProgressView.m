//
//  CircleProgressView.m
//  CircleProgressView
//
//  Created by Eric Rolf on 4/3/15.
//  Copyright (c) 2015 Eric Rolf. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()

struct Constants {              // Default Values = Private
    double circleDegress;       // = 360.0
    double minimumValue;        // = 0.000001
    double maximumValue;        // = 0.999999
    double ninetyDegrees;       // = 90.0
    double twoSeventyDegrees;   // = 270.0
    
};

@property (nonatomic, readwrite)           double internalProgress;
@property (nonatomic, readwrite)    struct Constants constants;

@end

@implementation CircleProgressView

@synthesize progress = _progress;

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

#pragma mark - Interface Builder

- (void)prepareForInterfaceBuilder {
    self.trackBackgroundColor = (self.trackBackgroundColor)? :[UIColor darkGrayColor];
    self.trackFillColor = (self.trackFillColor)? :[UIColor purpleColor];
    self.trackWidth = (self.trackWidth)? :10;
    self.clockwise = (self.clockwise)? :true;
    self.progress = (self.progress)? :.45;
    self.centerFillColor = (self.centerFillColor)? : [UIColor whiteColor];
}

#pragma mark - Setup

- (void)setup {
    self.contentView = [UIView new];
    self.constants = [self initConstants];
    
    [self addSubview:self.contentView];
}

- (struct Constants)initConstants {
    struct Constants constants;
    constants.circleDegress = 360.0;
    constants.minimumValue = 0.000001;
    constants.maximumValue = 0.999999;
    constants.ninetyDegrees = 90.0;
    constants.twoSeventyDegrees = 270.0;
    return constants;
}

#pragma mark - Setters

- (void)setProgress:(double)progress {
    _internalProgress = progress;
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)setClockwise:(BOOL)clockwise {
    _clockwise = clockwise;
    [self setNeedsDisplay];
}

- (void)setTrackWidth:(CGFloat)trackWidth {
    _trackWidth = trackWidth;
    [self setNeedsDisplay];
}

- (void)setTrackImage:(UIImage *)trackImage {
    _trackImage = trackImage;
    [self setNeedsDisplay];
}

- (void)setTrackBackgroundColor:(UIColor *)trackBackgroundColor {
    _trackBackgroundColor = trackBackgroundColor;
    [self setNeedsDisplay];
}

- (void) setTrackFillColor:(UIColor *)trackFillColor {
    _trackFillColor = trackFillColor;
    [self setNeedsDisplay];
}

- (void)setTrackBorderColor:(UIColor *)trackBorderColor {
    _trackBorderColor = trackBorderColor;
    [self setNeedsDisplay];
}

- (void)setTrackBorderWidth:(CGFloat)trackBorderWidth {
    _trackBorderWidth = trackBorderWidth;
    [self setNeedsDisplay];
}

- (void)setCenterFillColor:(UIColor *)centerFillColor {
    _centerFillColor = centerFillColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGRect innerRect = CGRectInset(rect, self.trackBorderWidth, self.trackBorderWidth);
    
    self.internalProgress = (self.internalProgress/1.0) == 0.0 ? self.constants.minimumValue : self.progress;
    self.internalProgress = (self.internalProgress/1.0) == 1.0 ? self.constants.maximumValue : self.internalProgress;
    self.internalProgress = self.clockwise ?
                            (-self.constants.twoSeventyDegrees + ((1.0 - self.internalProgress) * self.constants.circleDegress)) :
                            (self.constants.ninetyDegrees - ((1.0 - self.internalProgress) * self.constants.circleDegress));
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // background Drawing
    [self.trackBackgroundColor setFill];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(innerRect), CGRectGetMinY(innerRect), CGRectGetWidth(innerRect), CGRectGetHeight(innerRect))];
    [circlePath fill];
    
    if (self.trackBorderWidth > 0) {
        circlePath.lineWidth = self.trackBorderWidth;
        [self.trackBorderColor setStroke];
        [circlePath stroke];
    }
    
    // progress Drawing
    UIBezierPath *progressPath = [UIBezierPath new];
    CGRect progressRect = CGRectMake(CGRectGetMinX(innerRect), CGRectGetMinY(innerRect), CGRectGetWidth(innerRect), CGRectGetHeight(innerRect));
    CGPoint center = CGPointMake(CGRectGetMidX(progressRect), CGRectGetMidY(progressRect));
    CGFloat radius = progressRect.size.width / 2.0;
    CGFloat startAngle = self.clockwise ? (-self.internalProgress * M_PI / 180.0) : (self.constants.twoSeventyDegrees * M_PI / 180);
    CGFloat endAngle = self.clockwise ? (self.constants.twoSeventyDegrees * M_PI / 180) : (-self.internalProgress * M_PI / 180.0);
    
    [progressPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:!self.clockwise];
    [progressPath addLineToPoint:CGPointMake(CGRectGetMidX(progressRect), CGRectGetMidY(progressRect))];
    [progressPath closePath];
    
    CGContextSaveGState(ctx);
    
    [progressPath addClip];
    
    if (self.trackImage) {
        [self.trackImage drawInRect:innerRect];
    } else {
        [self.trackFillColor setFill];
        [circlePath fill];
    }
    
    CGContextRestoreGState(ctx);
    
    // center Drawing
    UIBezierPath *centerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMinX(innerRect) + self.trackWidth, CGRectGetMinY(innerRect) + self.trackWidth, CGRectGetWidth(innerRect) - (2 * self.trackWidth), CGRectGetHeight(innerRect) - (2 * self.trackWidth))];
    [self.centerFillColor setFill];
    [centerPath fill];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = centerPath.CGPath;
    self.contentView.layer.mask = layer;
}

@end
