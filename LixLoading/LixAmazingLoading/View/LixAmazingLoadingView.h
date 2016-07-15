//
//  LixAmazingLoadingView.h
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LixAmazingLoadingAnimationType) {
    LixAmazingLoadingAnimationTypeStar,
    LixAmazingLoadingAnimationTypeMusic,
    LixAmazingLoadingAnimationTypeSkype,
};

@interface LixAmazingLoadingView : UIView

@property (nonatomic, assign) LixAmazingLoadingAnimationType type;
@property (nonatomic, strong) UIColor *backgroundTintColor;
@property (nonatomic, strong) UIColor *loadingTintColor;
@property (nonatomic, assign) CGFloat size;

@property (nonatomic, readonly) BOOL animating;

- (id)initWithType:(LixAmazingLoadingAnimationType)type;

- (id)initWithType:(LixAmazingLoadingAnimationType)type
  loadingTintColor:(UIColor *)tintColor;

- (id)initWithType:(LixAmazingLoadingAnimationType)type
  loadingTintColor:(UIColor *)tintColor
              size:(CGFloat)size;

- (void)startAnimating;
- (void)stopAnimating;


@end

