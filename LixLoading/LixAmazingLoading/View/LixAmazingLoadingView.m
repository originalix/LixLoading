//
//  LixAmazingLoadingView.m
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "LixAmazingLoadingView.h"
#import "LixAmazingLoadingMusicsAnimation.h"
#import "LixAmazingLoadingStarAnimation.h"
#import "LixAmazingLoadingSkypeAnimation.h"

#define kLixAmazingLoadingDefaultSize 60.0f
#define kLixAmazingLoadingDefaultTintColor [UIColor colorWithRed:0.049 green:0.849 blue:1.000 alpha:1.000]

@interface LixAmazingLoadingView()

@property (nonatomic, strong) CABasicAnimation *fadeOutAnimation;

@end

@implementation LixAmazingLoadingView

#pragma mark - Life Cycle

- (id)initWithType:(LixAmazingLoadingAnimationType)type {
    return [self initWithType:type loadingTintColor:kLixAmazingLoadingDefaultTintColor size:kLixAmazingLoadingDefaultSize];
}

- (id)initWithType:(LixAmazingLoadingAnimationType)type loadingTintColor:(UIColor *)loadingTintColor {
    return [self initWithType:type loadingTintColor:loadingTintColor size:kLixAmazingLoadingDefaultSize];
}

- (id)initWithType:(LixAmazingLoadingAnimationType)type loadingTintColor:(UIColor *)loadingTintColor size:(CGFloat)size {
    self = [super init];
    if (self) {
        _type = type;
        _size = size;
        _loadingTintColor = loadingTintColor;
        _backgroundTintColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Setup Methods

- (void)setupAnimation {
    self.layer.sublayers = nil;
    
    id <LixAmazingLoadingAnimationProtocol> animation = [LixAmazingLoadingView amazingLoadingAnimationForAnimationType:self.type];
    
    [self setupAmazingLoadingSizeWithAnimationType:self.type];
    
    // 检验遵守协议的对象是否实现了协议方法
    if ([animation respondsToSelector:@selector(configureAnimationInLayer:withSize:tintColor:)]) {
        [self setupFadeOutState];
        [animation configureAnimationInLayer:self.layer withSize:CGSizeMake(self.size, self.size) tintColor:self.loadingTintColor];
    }
}

- (void)setupNormalState {
    self.layer.backgroundColor = self.backgroundTintColor.CGColor;
    self.layer.speed = 1.0f;
    self.layer.opacity = 1.0;
}

- (void)setupFadeOutState {
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.sublayers = nil;
    self.layer.speed = 0.0;
}

- (void)setupAmazingLoadingSizeWithAnimationType:(LixAmazingLoadingAnimationType)type {
    switch (type) {
        case LixAmazingLoadingAnimationTypeMusic:
            self.size = kLixAmazingLoadingDefaultSize;
            break;
        case LixAmazingLoadingAnimationTypeStar:
            self.size = 200;
            break;
        case LixAmazingLoadingAnimationTypeSkype:
            self.size = 50;
            break;
        default:
            break;
    }
}

#pragma mark - Public Methods

- (void)startAnimating {
    if (_animating) {
        return;
    }
    if (!self.layer.sublayers) {
        [self setupAnimation];
    }
    
    [self setupNormalState];
    
    _animating = YES;
}

- (void)stopAnimating {
    if (!_animating) {
        return;
    }
    
    [self.layer addAnimation:self.fadeOutAnimation forKey:@"fadeOutAnimation"];
    
    _animating = NO;
}

#pragma mark - Propertys

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    NSAssert(NO, @"请不要设置View的背景颜色，请使用setBackgroundTintColor:方法");
}

#pragma mark Getters

- (CABasicAnimation *)fadeAnimationWithOpacity:(CGFloat)opacity {
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.beginTime = CACurrentMediaTime();
    fadeAnimation.duration = 0.35;
    fadeAnimation.toValue = @(opacity);
    return fadeAnimation;
}

- (CABasicAnimation *)fadeOutAnimation {
    if (!_fadeOutAnimation) {
        _fadeOutAnimation = [self fadeAnimationWithOpacity:0.0];
        _fadeOutAnimation.delegate = self;
    }
    return _fadeOutAnimation;
}

+ (id <LixAmazingLoadingAnimationProtocol>)amazingLoadingAnimationForAnimationType:(LixAmazingLoadingAnimationType)type {
    switch (type) {
        case LixAmazingLoadingAnimationTypeStar:
            return [[LixAmazingLoadingStarAnimation alloc] init];
        case LixAmazingLoadingAnimationTypeMusic:
            return [[LixAmazingLoadingMusicsAnimation alloc] init];
        case LixAmazingLoadingAnimationTypeSkype:
            return [[LixAmazingLoadingSkypeAnimation alloc] init];
    }
    return nil;
}


#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CABasicAnimation *)animation finished:(BOOL)flag {
    [self setupFadeOutState];
}

@end
