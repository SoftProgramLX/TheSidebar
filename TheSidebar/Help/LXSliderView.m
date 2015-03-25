//
//  LXSliderView.m
//  侧边栏
//
//  Created by apple on 15/3/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LXSliderView.h"

@interface LXSliderView ()
{
    UIView *showLeftView;
    
    BOOL ShowLeft;
    float leftViewWidth;
    float lastContentOffset[2];
}

@property (strong, nonatomic) UIView *tapView;

@end

@implementation LXSliderView


- (instancetype)initWithRootController:(UIViewController *)rootVC withLeftView:(UIView *)leftView
{
    self = [super initWithFrame:rootVC.view.frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.0;
        
        showLeftView = leftView;
        leftViewWidth = leftView.frame.size.width;
        
        self.tapView = [[UIView alloc] initWithFrame:CGRectMake(leftViewWidth, 0, self.frame.size.width - leftViewWidth, self.frame.size.height)];
        [self addSubview:self.tapView];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [rootVC.view addGestureRecognizer:pan];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [rootVC.view addGestureRecognizer:tap];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer*)sender
{
    CGPoint deltaPoint = [sender translationInView:self];
    
    if (ShowLeft) {
        deltaPoint.x += leftViewWidth;
    }
    
    if (sender.state == UIGestureRecognizerStateChanged){
        if (deltaPoint.x >= 0 && deltaPoint.x <= leftViewWidth) {
            [showLeftView setTransform:CGAffineTransformMakeTranslation(deltaPoint.x, 0)];
            lastContentOffset[1] = lastContentOffset[0];
            lastContentOffset[0] = deltaPoint.x;
        }
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if (!ShowLeft && deltaPoint.x > 0 && lastContentOffset[1] < deltaPoint.x) {
            [self openSilderView];
        } else if (deltaPoint.x < leftViewWidth && lastContentOffset[1] > deltaPoint.x) {
            [self closeSilderView];
        }
    }
}

- (void)openSilderView
{
    if (ShowLeft) {
        return;
    }
    ShowLeft = YES;
    [UIView animateWithDuration:0.25 animations:^{
        [showLeftView setTransform:CGAffineTransformMakeTranslation(leftViewWidth, 0)];
        self.alpha = 0.4;
    }];
}

- (void)closeSilderView
{
    ShowLeft = NO;
    [UIView animateWithDuration:0.25 animations:^{
        [showLeftView setTransform:CGAffineTransformMakeTranslation(0, 0)];
        self.alpha = 0;
    }];
}

- (void)tapGesture:(UITapGestureRecognizer*)sender{
    if (ShowLeft) {
        [self closeSilderView];
    }
}

@end
