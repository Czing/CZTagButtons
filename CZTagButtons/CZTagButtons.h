//
//  CZTagButtons.h
//  CZTagButtons
//
//  Created by Cyzing on 17/3/2.
//  Copyright © 2017年 Cyzing. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat const INTERSTICE;
UIKIT_EXTERN CGFloat const TagMargin;
UIKIT_EXTERN CGFloat const GTagH;

@interface CZTypographyButtonConfig :NSObject
@property(nonatomic,strong)UIImage *backGroundImage; //背景图片
@property(nonatomic,strong)UIImage *backGroundSelectImage; //选中的背景图片
@property(nonatomic,strong)UIColor *backGroundColor; //背景颜色
@property(nonatomic,strong)UIColor *backGroundSelectColor;//选中的背景颜色
//-------------------------
@property(nonatomic,assign)CGFloat font; //字体
@property(nonatomic,assign)CGFloat tagH;//标签高度
@property(nonatomic,assign)CGFloat tagMargin; //标签边缘宽度
//---------------
@property(nonatomic,strong)UIColor *textColor; //字体颜色
@property(nonatomic,strong)UIColor *textSelectColor;//选中字体颜色
@property(nonatomic,assign)CGFloat layerCornerRadius;//圆角
@property(nonatomic,assign)CGFloat borderWidth;//线框宽度
@property(nonatomic,strong)UIColor *borderColor;//线框颜色
@property(nonatomic,assign)NSInteger selectIndex;//被选中的索引
@property(nonatomic,assign)BOOL defaultNoSelect;//默认不被选中



@end



@interface CZTypographyButton :UIButton

@end


@interface CZTagButtons : UIView
//view背景颜色
@property(nonatomic,strong)UIColor *cz_backgroundColor;

//按钮的字体颜色
@property(nonatomic,strong)UIColor *cz_buttonTitleColor;
//按钮的背景颜色
@property(nonatomic,strong)UIColor *cz_buttonBackgroundColor;




/**
 *  Description
 *
 *  @param completionHandler   回调block
 *  @param buttonTitles 按钮的总个数
 *  @param viewF 设置当前frame  -warning   frame.h 设置无效

 */

- (instancetype)initWithCompletionHandlerBlock:(void(^)(CZTypographyButton *button , NSInteger index ))completionHandler
                        typographyButtonTitles:(NSArray *)buttonTitles config:(CZTypographyButtonConfig *)config
                                withSuperViewF:(CGRect)viewF;




@end
