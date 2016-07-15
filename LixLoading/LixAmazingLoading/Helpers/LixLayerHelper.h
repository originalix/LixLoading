//
//  LixLayerHelper.h
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LixLayerHelper : NSObject

+ (void)addTextLayerWithText:(NSString *)text atLayer:(CALayer *)layer;

+ (CAReplicatorLayer *)addReplicatorLayerWithFrame:(CGRect)frame atLayer:(CALayer *)layer;

+ (CGRect)initializerFrameWithSize:(CGSize)size;


@end
