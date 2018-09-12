//
//  KKTabBar.m
//  KKTabBarVC
//
//  Created by kkmac on 2018/9/12.
//  Copyright © 2018年 kkmac. All rights reserved.
//

#import "KKTabBar.h"

@interface KKTabBar ()
@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation KKTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addControl];
    }
    return self;
}

- (void)addControl {
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _centerBtn.adjustsImageWhenHighlighted = NO;
//    [self addSubview:_centerBtn];
    _centerBtn.backgroundColor = [UIColor redColor];
    [_centerBtn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick {
    NSLog(@"====");
}

//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            //返回按钮
            return _centerBtn;
        }
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count;
    CGFloat width = CGRectGetWidth(self.frame)*1.0/count;
    CGFloat height = CGRectGetHeight(self.frame);
    _centerBtn.frame = CGRectMake(0, 0, width, height*3/2.0);
    _centerBtn.center = CGPointMake(self.center.x, height/4.0);
    if (![self.subviews containsObject:_centerBtn] && count > 0) {
        [self addSubview:_centerBtn];
    }
    
}

@end





