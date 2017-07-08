//
//  MoreTitleEventView.h
//  BlueToothDemo
//
//  Created by 周必稳 on 2017/6/21.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTitleEventView : UIView


+ (instancetype)moreTitleView:(NSString *)text frame:(CGRect)frame;

- (void)targetText:(NSString *)text
                 textColor:(UIColor *)color
                    target:(id)target
                    action:(SEL)action;

@end
