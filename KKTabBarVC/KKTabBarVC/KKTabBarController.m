//
//  KKTabBarController.m
//  KKTabBarVC
//
//  Created by kkmac on 2018/9/12.
//  Copyright © 2018年 kkmac. All rights reserved.
//

#import "KKTabBarController.h"
#import "KKTabBar.h"

@interface KKTabBarController ()

@end

@implementation KKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KKTabBar *tabbar = [[KKTabBar alloc] init];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.tabBarItem = [self tabBarItemWithTitle:nil image:[UIImage imageNamed:@"淘宝"] selectedImage:[UIImage imageNamed:@"淘宝1"] tag:1];
    //只是作为占位置
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    vc2.tabBarItem = [self tabBarItemWithTitle:nil image:nil selectedImage:nil tag:2];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    vc3.tabBarItem = [self tabBarItemWithTitle:nil image:[UIImage imageNamed:@"淘宝"] selectedImage:[UIImage imageNamed:@"淘宝1"] tag:3];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    self.viewControllers = @[vc1, vc2, vc3];
}

- (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectImage tag:(NSInteger)tag {
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image tag:tag];
    item.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return item;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}

@end
