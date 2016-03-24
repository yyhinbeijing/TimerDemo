//
//  ViewController.m
//  TimerDemo
//
//  Created by summer on 16/3/22.
//  Copyright © 2016年 cn.exutech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger index;
    NSInteger tapIndex;
    NSInteger tapIndex2;
    BOOL excuteFinished;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    index = 0;
    tapIndex = 0;
    excuteFinished = YES;
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(40, 50, 50, 50);
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}

- (void)buttonAction:(UIButton *)sender {
    tapIndex++;
    tapIndex2++;
    if (excuteFinished) {//里面没有执行完毕我就不允许你进去，多好的东西。
        excuteFinished = NO;
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1* NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            NSLog(@"里面执开始执行啦");
            index ++;
            NSLog(@"执行的数量%ld",(long)index);
            NSLog(@"tapIndex执行的数量%ld",(long)tapIndex);
            tapIndex = 0;
            excuteFinished = YES;
            
            
        });
        
    }
    NSLog(@"一共点击了多少次%ld",(long)tapIndex2);
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
