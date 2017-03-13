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
    CZTagButtons *button  =[[CZTagButtons alloc]initWithCompletionHandlerBlock:^(CZTypographyButton *button, NSInteger index) {
        
        
        NSLog(@"%@----%zd ",button.titleLabel.text,index);
        
    } typographyButtonTitles:@[@"ios",@"andriod",@"java",@"手机开发",@"web前端开发",@"好程序员学前班",@"VR学习",@"智能机器人",@"C++",@"HTML/CSS",@"C#",@"Swift",@"JavaScript",@"R",@"Git",@".NET"] withSuperViewF:CGRectMake(10, 100, M_W -20, 10000)];
    
    //    button.cz_backgroundColor = [UIColor blueColor];
    
    //    button.cz_buttonTitleColor = [UIColor yellowColor];
    [self.view addSubview:button];
    NSLog(@"%f",button.frame.size.height);

}


@end
