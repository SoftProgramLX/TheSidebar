# TheSidebar

####使用OC简单高效实现侧边栏功能,支持手势右拖弹出侧边栏，然后单击右边半透明部分可收缩，效果图如下：<br>
![image1](https://github.com/SoftProgramLX/TheSidebar/blob/master/TheSidebar/screen1.png)      ![image1](https://github.com/SoftProgramLX/TheSidebar/blob/master/TheSidebar/screen2.png)

* 三行代码集成实现。
```objective-c
    self.showLeftView = [[LXShowView alloc] initWithFrame:CGRectMake(-0.75*kMainScreenWidth, 0, 0.75*kMainScreenWidth, kMainScreenHeight) withRootController:self];
    self.showLeftView.delegate = self;
    [self.navigationController.view addSubview:self.showLeftView];
```
* 侧边栏功能的核心代码在LXSliderView这个类实现。
* 弹出的侧边栏在LXShowView这个类里面修改所需样式，出了显示的点击按钮外不能删除其它原有代码。
* LXViewController这是测试控制器。

