//
//  LixAmazingLoadingAnimationProtocol.h
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LixAmazingLoadingAnimationProtocol <NSObject>

// 抽象协议
- (void)configureAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor;


@end
