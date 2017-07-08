//
//  PiechartView.m
//  CustomViews
//
//  Created by 周必稳 on 2017/6/13.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "PiechartView.h"


@interface PiechartView ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation PiechartView

+ (instancetype)pieChartViewWithFrame:(CGRect)frame {
    PiechartView *view = [[PiechartView alloc] initWithFrame:frame];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 弧线的长度在变化，填充区域在变化
        self.backgroundColor = [UIColor yellowColor];
        
        CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:center.x / 2 - 10
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI_2 * 3
                                                         clockwise:YES];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        _shapeLayer = shapeLayer;
        shapeLayer.lineWidth = (center.x / 2 - 10) * 2 + 1;
        
        _shapeLayer.backgroundColor = [UIColor yellowColor].CGColor;
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
        shapeLayer.path = path.CGPath;
        
        
        CAShapeLayer *baseLayer = [CAShapeLayer layer];
        baseLayer.fillColor = [UIColor clearColor].CGColor;
        baseLayer.strokeColor = [UIColor redColor].CGColor;
        baseLayer.lineWidth = (center.x / 2 - 10) * 2;
        baseLayer.strokeEnd = 0.25;
        baseLayer.path = path.CGPath;
        
        CAShapeLayer *secondLayer = [CAShapeLayer layer];
        secondLayer.strokeStart = 0.25;
        secondLayer.strokeEnd = 0.6;
        secondLayer.fillColor = [UIColor clearColor].CGColor;
        secondLayer.strokeColor = [UIColor purpleColor].CGColor;
        secondLayer.lineWidth = (center.x / 2 - 10) * 2;
        secondLayer.path = path.CGPath;
        
        CAShapeLayer *thirdLayer = [CAShapeLayer layer];
        thirdLayer.strokeStart = 0.6;
        thirdLayer.strokeEnd = 0.75;
        thirdLayer.fillColor = [UIColor clearColor].CGColor;
        thirdLayer.strokeColor = [UIColor greenColor].CGColor;
        thirdLayer.lineWidth = (center.x / 2 - 10) * 2;
        thirdLayer.path = path.CGPath;
        
        CAShapeLayer *lastLayer = [CAShapeLayer layer];
        lastLayer.strokeStart = 0.75;
        lastLayer.strokeEnd = 1;
        lastLayer.fillColor = [UIColor clearColor].CGColor;
        lastLayer.strokeColor = [UIColor orangeColor].CGColor;
        lastLayer.lineWidth = (center.x / 2 - 10) * 2;
        lastLayer.path = path.CGPath;

        // 蒙版图层的颜色只跟根视图的背景色一致，手动设置的值无效
        // 设置蒙版图层会改变原有视图layer的显示区域，蒙版图层等于根图层
        // 动画 跟图层是否设置为蒙版图层无关 、
        //之前错误原因在于fromValue的格式设置错误，需要的是个对象类型，而不是数值类型

        self.layer.mask = shapeLayer;
        [self.layer addSublayer:baseLayer];
        [self.layer addSublayer:secondLayer];
        [self.layer addSublayer:thirdLayer];
        [self.layer addSublayer:lastLayer];
        
//        [self.layer addSublayer:shapeLayer];

    }
    return self;
}

- (void)showAnimation {
//    return;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3.0;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [_shapeLayer addAnimation:animation forKey:@"strokeEnd"];

}


@end
