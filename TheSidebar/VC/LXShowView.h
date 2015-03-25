//
//  LXShowView.h
//  侧边栏
//
//  Created by apple on 15/3/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXShowView : UIView

@property (nonatomic, strong) id delegate;

- (instancetype)initWithFrame:(CGRect)frame withRootController:(UIViewController *)rootVC;
- (void)openSilderView;
- (void)closeSilderView;

@end
