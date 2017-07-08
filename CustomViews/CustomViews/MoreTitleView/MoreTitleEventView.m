//
//  MoreTitleEventView.m
//  BlueToothDemo
//
//  Created by 周必稳 on 2017/6/21.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "MoreTitleEventView.h"

@interface MoreTitleEventView ()

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;

@end

@implementation MoreTitleEventView

+ (instancetype)moreTitleView:(NSString *)text frame:(CGRect)frame {
    MoreTitleEventView *view = [[MoreTitleEventView alloc]initWithFrame:frame];
    view.text = text;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)targetText:(NSString *)text
         textColor:(UIColor *)color
            target:(id)target
            action:(SEL)action {
    if (![self.text containsString:text]) {
        NSAssert(0, @"查询字符串不存在");
        return;
    }
    CGFloat width = self.bounds.size.width;
    
    NSDictionary *attributes = @{NSFontAttributeName : self.font};
    NSString *forwardStr = [self.text componentsSeparatedByString:text].firstObject;
    
    CGRect forwardRect = [forwardStr boundingRectWithSize:CGSizeMake(self.bounds.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize oneLineSize = [forwardStr sizeWithAttributes:attributes];
    
    CGFloat btnx = oneLineSize.width - forwardRect.size.width * (int)((forwardRect.size.height / self.font.lineHeight) - 1);
    CGFloat btny = CGRectGetMaxY(forwardRect) - self.font.lineHeight;
    
    CGSize btnSize = [text sizeWithAttributes:attributes];
    CGRect btnFrame = (CGRect){{btnx,btny},btnSize};

    if (CGRectGetMaxX(btnFrame) > self.bounds.size.width) {
        int btnCount = 1;
        CGFloat totalWidth = btnSize.width + btnx;
        while (totalWidth > width) {
            totalWidth = totalWidth - width;
            btnCount++;
        }
        
        int loc = 0;
        for (int i = 0; i < btnCount; i++) {
            UIButton *btn = [self eventButton];
            if (i == 0) {
                CGFloat bili = (width - btnx) / btnSize.width;
                int index = text.length * bili;
                loc = index;
                [btn setTitle:[text substringToIndex:index] forState:UIControlStateNormal];
                btn.frame = (CGRect){{btnx,btny + i * self.font.lineHeight},{width - btnx,self.font.lineHeight}};
            }else if (i == btnCount - 1) {
                NSString *str = [text substringWithRange:NSMakeRange(loc, text.length - loc)];
                [btn setTitle:str forState:UIControlStateNormal];
                btn.frame = (CGRect){{0,btny + i * self.font.lineHeight},[str sizeWithAttributes:attributes]};
            }else {
                CGFloat bili = width / btnSize.width;
                int index = text.length * bili;
                [btn setTitle:[text substringWithRange:NSMakeRange(loc, index)] forState:UIControlStateNormal];
                btn.frame = (CGRect){{0,btny + i * self.font.lineHeight},{width,self.font.lineHeight}};
                loc += index;
            }
            [btn setTitleColor:color forState:UIControlStateNormal];
            [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
    }else {
        UIButton *btn = [self eventButton];
        btn.frame = (CGRect){{btnx,btny},btnSize};
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIButton *)eventButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn.titleLabel.font = self.font;
    btn.backgroundColor = self.backgroundColor;
    [self addSubview:btn];
    return btn;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawInRect:self.bounds withAttributes:@{NSFontAttributeName : self.font}];
}

@end
