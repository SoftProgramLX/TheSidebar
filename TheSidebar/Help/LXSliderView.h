//
//  LXSliderView.h
//  侧边栏
//
//  Created by apple on 15/3/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXSliderView : UIView

- (instancetype)initWithRootController:(UIViewController *)rootVC withLeftView:(UIView *)leftView;
- (void)openSilderView;
- (void)closeSilderView;

@end
