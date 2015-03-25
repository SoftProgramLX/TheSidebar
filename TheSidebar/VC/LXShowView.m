//
//  LXShowView.m
//  侧边栏
//
//  Created by apple on 15/3/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LXShowView.h"
#import "LXSliderView.h"
#import "LXViewController.h"

@interface LXShowView ()

@property (strong, nonatomic) LXSliderView *sliderView;

@end

@implementation LXShowView

- (instancetype)initWithFrame:(CGRect)frame withRootController:(UIViewController *)rootVC
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        self.sliderView = [[LXSliderView alloc] initWithRootController:rootVC withLeftView:self];
        [rootVC.navigationController.view addSubview:self.sliderView];
        
        //在这里添加侧边栏所需控件
        UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
        [but addTarget:self action:@selector(leftDelagateFunction:) forControlEvents:UIControlEventTouchUpInside];
        but.backgroundColor = [UIColor blueColor];
        [but setTitle:@"点击" forState:UIControlStateNormal];
        [self addSubview:but];
    }
    return self;
}

- (void)leftDelagateFunction:(id)sender
{
    UIViewController *vc = self.delegate;
    [vc.navigationController pushViewController:[[LXViewController alloc] init] animated:YES];
    [self.sliderView closeSilderView];
}

- (void)openSilderView
{
    [self.sliderView openSilderView];
}

- (void)closeSilderView
{
    [self.sliderView closeSilderView];
}

@end










