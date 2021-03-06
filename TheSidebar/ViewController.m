//
//  ViewController.m
//  TheSidebar
//
//  Created by apple on 15/3/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LXShowView.h"

// 屏幕宽与高
#define kMainScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)
#define kMainScreenHeight (([UIScreen mainScreen].applicationFrame.size.height)+20)
#define kSidebarWidthRatio 0.75

@interface ViewController ()
@property (strong, nonatomic) LXShowView *showLeftView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(280, 100, 200, 40)];
    lab.text = @"向右拖动";
    [self.view addSubview:lab];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBarBtnClicked:)];
    
    self.showLeftView = [[LXShowView alloc] initWithFrame:CGRectMake(-kSidebarWidthRatio*kMainScreenWidth, 0, kSidebarWidthRatio*kMainScreenWidth, kMainScreenHeight) withRootController:self];
    self.showLeftView.delegate = self;
    [self.navigationController.view addSubview:self.showLeftView];
}

- (void)leftBarBtnClicked:(id)sender
{
    [self.showLeftView openSilderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


