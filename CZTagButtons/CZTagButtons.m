//
//  CZTagButtons.m
//  CZTagButtons
//
//  Created by Cyzing on 17/3/2.
//  Copyright © 2017年 Cyzing. All rights reserved.
//

#import "CZTagButtons.h"
#import <objc/runtime.h>

#define M_W [UIScreen mainScreen].bounds.size.width

CGFloat const INTERSTICE = 20;
CGFloat const TagMargin  = 15;
CGFloat const TagH = 30;

const char completionHandlerKey;

//辅助 类别
@interface UIView (Extension)

@end
@implementation UIView (Extension)

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

@end

@implementation CZTypographyButtonConfig

@end

@interface CZTypographyButton ()

@end

@implementation CZTypographyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor  whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
//    self.width += 2 * TagMargin;
    self.height = TagH;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.titleLabel.x = TagMargin;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = true;
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = false;
    [super touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = false;
    [super touchesCancelled:touches withEvent:event];
}
@end

@interface CZTagButtons (){
    CZTypographyButtonConfig *_config;
    CZTypographyButton *_currentButton;
}
@property (nonatomic, strong) NSMutableArray *tagButtons;
@property(nonatomic,strong)UIButton *currentBtn;
@property(nonatomic,strong)NSMutableArray *buttons;

@end

@implementation CZTagButtons
 CGRect  _viewRect;
- (NSMutableArray *)tagButtons
{
    if (!_tagButtons) {
        _tagButtons = [NSMutableArray array];
    }
    return _tagButtons;
}
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttons;
}
- (instancetype)initWithCompletionHandlerBlock:(void(^)(CZTypographyButton *button , NSInteger index ))completionHandler
                        typographyButtonTitles:(NSArray *)buttonTitles
                                        config:(CZTypographyButtonConfig *)config
                                withSuperViewF:(CGRect)viewF{
    self = [super init];
    if (self) {
        _viewRect = viewF;
        self.frame = viewF;
        _config = config;
        [self.tagButtons addObjectsFromArray:buttonTitles];
        [self loadSubViews];
        objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
    }
    return self;
}
-(void)layoutSubviews{
    if (self.buttons.count) {
        CZTypographyButton *lastedBtn = (CZTypographyButton *)self.buttons[self.buttons.count -1];
        self.height = CGRectGetMaxY(lastedBtn.frame) +INTERSTICE;
    }
}
-(void)loadSubViews{
    for (NSInteger i =0; i < self.tagButtons.count; i++) {
        CZTypographyButton *button  =[CZTypographyButton buttonWithType:UIButtonTypeCustom];
        [self.buttons addObject:button];
        button.tag = i;
        if (_config.backGroundImage) {
            [button setBackgroundImage:_config.backGroundImage forState:UIControlStateNormal];
        }
        if (_config.backGroundSelectImage) {
            [button setBackgroundImage:_config.backGroundSelectImage forState:UIControlStateSelected];
        }
        if (_config.layerCornerRadius) {
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = _config.layerCornerRadius;
        }
        if (_config.borderWidth) {
            button.layer.borderWidth = _config.borderWidth;
        }
        if (_config.borderColor) {
            button.layer.borderColor = _config.borderColor.CGColor;
        }
        if (_config.selectIndex == i && !_config.defaultNoSelect) {
            _currentButton = button;
            button.selected = YES;
        }
        if (_config.textColor) {
            [button setTitleColor:_config.textColor forState:UIControlStateNormal];
        }
        if (_config.textSelectColor) {
            [button setTitleColor:_config.textSelectColor forState:UIControlStateSelected];
        }
        if (_config.font) {
            [button.titleLabel setFont:[UIFont systemFontOfSize:_config.font]];
        }
        
//        button.tag = i + 1000;
        [button setTitle:self.tagButtons[i] forState:UIControlStateNormal];
        if (_config.tagH) {
            button.height = _config.tagH;
        }
        if (_config.tagMargin) {
            button.width += 2 * _config.tagMargin;
        }else{
            button.width += 2 * TagMargin;
        }
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (_config.backGroundColor) {
            [button setBackgroundColor:_config.backGroundColor];
        }
        [self addSubview:button];
    }
    [self  refreshBtnF];
}
-(void)refreshBtnF{
    CGFloat buttonX = 5;
    CGFloat buttonY = 5;
    for (NSInteger i =0; i< self.buttons.count; i++) {
        CZTypographyButton *button = (CZTypographyButton *)self.buttons[i];
        if (i==0) {
            button.x = buttonX;
            button.y = buttonY;
        }else{
            UIButton *lastButton = (CZTypographyButton *)self.buttons[i-1];
            CGFloat lastBtnX = CGRectGetMaxX(lastButton.frame);
            CGFloat lastBtnY = CGRectGetMinY(lastButton.frame);
            button.x =  lastBtnX + INTERSTICE;
            button.y = lastBtnY;
            if (CGRectGetMaxX(button.frame) > (_viewRect.size.width? _viewRect.size.width :M_W)) {
                button.y = CGRectGetMaxY(lastButton.frame)+ INTERSTICE;
                button.x = buttonX;
            }
        }
    }
    [self layoutIfNeeded];
}
-(void)btnClick:(CZTypographyButton *)button{
    if (_currentButton) {
        _currentButton.selected = NO;
        if (_config.backGroundColor) {
            [_currentButton setBackgroundColor:_config.backGroundColor];
        }
    }
    button.selected = YES;
    _currentButton = button;
    if (_config.backGroundSelectColor) {
        [_currentButton setBackgroundColor:_config.backGroundSelectColor];
    }
    void(^completHandleBlock)(CZTypographyButton *btn,NSInteger index) = objc_getAssociatedObject(self, &completionHandlerKey);
    !completHandleBlock?:completHandleBlock(button,button.tag);
}
-(void)setCz_backgroundColor:(UIColor *)cz_backgroundColor{
    _cz_backgroundColor = cz_backgroundColor;
    self.backgroundColor = cz_backgroundColor;
}
-(void)setCz_buttonTitleColor:(UIColor *)cz_buttonTitleColor{
    _cz_buttonTitleColor = cz_buttonTitleColor;
    for (NSInteger i =0; i<self.buttons.count; i++) {
        CZTypographyButton *btn  =(CZTypographyButton *)self.buttons[i];
        [btn setTitleColor:cz_buttonTitleColor forState:UIControlStateNormal];
    }
}
-(void)setCz_buttonBackgroundColor:(UIColor *)cz_buttonBackgroundColor{
    _cz_backgroundColor = cz_buttonBackgroundColor;
    for (NSInteger i =0; i<self.buttons.count; i++) {
        CZTypographyButton *btn  =(CZTypographyButton *)self.buttons[i];
        btn.backgroundColor = cz_buttonBackgroundColor;
    }
}
@end
