//
//  LixAmazingLoadingStarAnimation.m
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "LixAmazingLoadingStarAnimation.h"
#import "LixLayerHelper.h"

#define kLixAmazingLoadingDuration 4.0f
#define kLixAmazingLoadingDotNumber 29

@implementation LixAmazingLoadingStarAnimation

- (void)configureAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
 
    CGRect replicatorLayerFrame = [LixLayerHelper initializerFrameWithSize:size];
    CAReplicatorLayer *replicatorLayer = [LixLayerHelper addReplicatorLayerWithFrame:replicatorLayerFrame atLayer:layer];
    
    [self addAnimationDotLayerAtLayer:replicatorLayer tintColor:tintColor];
    
    [LixLayerHelper addTextLayerWithText:@"Lix" atLayer:replicatorLayer];
    
    // 核心代码
    replicatorLayer.instanceCount = kLixAmazingLoadingDotNumber;
    replicatorLayer.instanceDelay = kLixAmazingLoadingDuration / kLixAmazingLoadingDotNumber;
    replicatorLayer.instanceColor = tintColor.CGColor;
}

- (void)addAnimationDotLayerAtLayer:(CALayer *)layer tintColor:(UIColor *)tintColor {
    CALayer *dotLayer = [CALayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 10, 10);
    dotLayer.backgroundColor = tintColor.CGColor;
    dotLayer.cornerRadius = CGRectGetMidX(dotLayer.bounds);
    dotLayer.shouldRasterize = YES;
    dotLayer.opacity = 0.0;
    dotLayer.rasterizationScale = [[UIScreen mainScreen] scale];
    [layer addSublayer:dotLayer];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = [self initializerStarBezierPath];
    keyframeAnimation.duration = 4.0;
    keyframeAnimation.repeatCount = CGFLOAT_MAX;
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.15, 0.15, 1.0)];
    scaleAnim.duration = 0.8;
    scaleAnim.repeatCount = CGFLOAT_MAX;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 0.1;
    opacityAnimation.toValue = @(1.0);
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGrop = [CAAnimationGroup animation];
    animationGrop.animations = @[keyframeAnimation, scaleAnim, opacityAnimation];
    animationGrop.duration = kLixAmazingLoadingDuration;
    animationGrop.repeatCount = CGFLOAT_MAX;
    
    [dotLayer addAnimation:animationGrop forKey:nil];
}

- (CGPathRef)initializerStarBezierPath {
    UIBezierPath *starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(98, 16)];
    [starPath addLineToPoint: CGPointMake(129.74, 62.31)];
    [starPath addLineToPoint: CGPointMake(183.6, 78.19)];
    [starPath addLineToPoint: CGPointMake(149.36, 122.69)];
    [starPath addLineToPoint: CGPointMake(150.9, 178.81)];
    [starPath addLineToPoint: CGPointMake(98, 160)];
    [starPath addLineToPoint: CGPointMake(45.1, 178.81)];
    [starPath addLineToPoint: CGPointMake(46.64, 122.69)];
    [starPath addLineToPoint: CGPointMake(12.4, 78.19)];
    [starPath addLineToPoint: CGPointMake(66.26, 62.31)];
    [starPath closePath];
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 1.0);
    CGPathRef path = CGPathCreateCopyByTransformingPath(starPath.CGPath, &transform);
    return CFBridgingRetain(CFBridgingRelease(path));
}


@end
