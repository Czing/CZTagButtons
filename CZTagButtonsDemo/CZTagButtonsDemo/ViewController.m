//
//  ViewController.m
//  CZTagButtonsDemo
//
//  Created by Cyzing on 17/3/7.
//  Copyright © 2017年 Cyzing. All rights reserved.
//

#import "ViewController.h"
#import "CZTagButtons.h"

#define M_W [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CZTypographyButtonConfig *config = [[CZTypographyButtonConfig alloc]init];
    config.textSelectColor = [UIColor redColor];
    config.layerCornerRadius = 5;
    config.borderColor = [UIColor lightGrayColor];
    config.borderWidth = 0.5f;
    config.selectIndex = 2;
    CZTagButtons *button  =[[CZTagButtons alloc]initWithCompletionHandlerBlock:^(CZTypographyButton *button, NSInteger index) {
        
        
        NSLog(@"%@----%zd ",button.titleLabel.text,index);
        
    } typographyButtonTitles:@[@"ios",@"andriod",@"java",@"手机开发",@"web前端开发",@"好程序员学前班",@"VR学习",@"智能机器人",@"C++",@"HTML/CSS",@"C#",@"Swift",@"JavaScript",@"R",@"Git",@".NET"] config:config withSuperViewF:CGRectMake(10, 100, M_W -20, 10000)];
    
    //    button.cz_backgroundColor = [UIColor blueColor];
    
    //    button.cz_buttonTitleColor = [UIColor yellowColor];
    [self.view addSubview:button];
    //获取buttons的高度
    NSLog(@"%f",button.frame.size.height);

}


@end
