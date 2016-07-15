//
//  LixLayerHelper.m
//  TestStoryBoard
//
//  Created by Lix on 16/7/14.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "LixLayerHelper.h"

@implementation LixLayerHelper

+ (void)addTextLayerWithText:(NSString *)text atLayer:(CALayer *)layer {
    CGRect textRect = CGRectMake(47, 85, 100, 40);
    CATextLayer *labelLayer = [[CATextLayer alloc] init];
    labelLayer.contentsScale = [[UIScreen mainScreen] scale];
    labelLayer.font = (__bridge CFStringRef)@"Arial-ItalicMT";
    [labelLayer setFontSize:28];
    [labelLayer setFrame:textRect];
    [labelLayer setString:text];
    [labelLayer setAlignmentMode:kCAAlignmentCenter];
    [labelLayer setForegroundColor:[[UIColor blackColor] CGColor]];
    [layer addSublayer:labelLayer];
}

+ (CAReplicatorLayer *)addReplicatorLayerWithFrame:(CGRect)frame atLayer:(CALayer *)layer {
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    replicatorLayer.frame = frame;
    
    [layer addSublayer:replicatorLayer];
    return replicatorLayer;
}

+ (CGRect)initializerFrameWithSize:(CGSize)size {
    CGFloat mainHeight = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    CGFloat mainWdiht = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGRect frame = CGRectMake((mainWdiht - size.width) / 2.0,
                              (mainHeight - size.height) / 2.0,
                              size.width, size.height);
    return frame;
}



@end
