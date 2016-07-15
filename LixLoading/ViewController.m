//
//  ViewController.m
//  LixLoading
//
//  Created by Lix on 16/7/15.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "ViewController.h"
#import "LixAmazingLoadingView.h"

@interface ViewController ()

@property (nonatomic, assign) LixAmazingLoadingAnimationType amazingLoadingAnimationType;
@property (nonatomic, strong) UIColor *backgroundTintColor;
@property (nonatomic, strong) UIColor *loadingTintColor;

@property (nonatomic, assign) NSTimeInterval delayTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setup];
    [self testAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)setup {
    self.loadingTintColor = [UIColor colorWithRed:75.0f/255.0f green:215.0f/255.0f blue:99.0f/255.0f alpha:1];
    self.backgroundTintColor = [UIColor clearColor];
    self.delayTime = 2;
}

- (void)testAnimation{
    LixAmazingLoadingView *amazingLoadingView = [[LixAmazingLoadingView alloc] initWithType:LixAmazingLoadingAnimationTypeSkype];
    amazingLoadingView.loadingTintColor = self.loadingTintColor;
    amazingLoadingView.backgroundTintColor = self.backgroundTintColor;
    amazingLoadingView.frame = CGRectMake(100, 100, 10, 10);
    [self.view addSubview:amazingLoadingView];
    [amazingLoadingView startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [amazingLoadingView stopAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [amazingLoadingView startAnimating];
            NSLog(@"动画完成");
        });
    });
}


@end
