# CZTagButtons
实现按钮的不规则排序
====  
![image](https://github.com/Czing/CZTagButtons/raw/master/czing_tag_btn.png)
-----

#Podfile</br>
To integrate YJSettingTableView into your Xcode project using CocoaPods, specify it in your `Podfile`:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '7.0'

target 'TargetName' do
pod'CZTagButtons'    ,'~>1.0.2'
end
```
### 使用说明
//block回调 点击标签信息 *frame填写的时高度失效 内部已经计算好 可以获取buttons的高度
```
 CZTagButtons *button  =[[CZTagButtons alloc]initWithCompletionHandlerBlock:^(CZTypographyButton *button, NSInteger index) {
        NSLog(@"%@----%zd ",button.titleLabel.text,index);
        
    } typographyButtonTitles:@[@"ios",@"andriod",@"java",@"手机开发",@"web前端开发",@"好程序员学前班",@"VR学习",@"智能机器人",@"C++",@"HTML/CSS",@"C#",@"Swift",@"JavaScript",@"R",@"Git",@".NET"] withSuperViewF:CGRectMake(10, 100, M_W -20, 10000)];

```
 [swift参考Demo ](https://github.com/Czing/CZTagButtonsSwiftDemo) 
 ------- 
