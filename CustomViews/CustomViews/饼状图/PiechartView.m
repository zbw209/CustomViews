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
        
        NSLog(@"%s,%d center.x = %f",__FUNCTION__,__LINE__,center.x);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:center.x / 2 - 10
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI_2 * 3
                                                         clockwise:YES];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        _shapeLayer = shapeLayer;
        shapeLayer.lineWidth = (center.x / 2 - 10) * 2;
        
        _shapeLayer.backgroundColor = [UIColor redColor].CGColor;
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor brownColor].CGColor;
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
        
        // 蒙版视图的颜色只跟根视图的背景色一致，手动设置的值无效
        
        // 动画 跟图层是否设置为蒙版视图无关 、
        //之前错误原因在于fromValue的格式设置错误，需要的是个对象类型，而不是数值类型

//        baseLayer.masksToBounds = YES;
//        baseLayer.mask = shapeLayer;
//        [baseLayer addSublayer:shapeLayer];
//        [self.layer addSublayer:baseLayer];
        
        self.layer.mask = shapeLayer;
        [self.layer addSublayer:baseLayer];
        [self.layer addSublayer:secondLayer];
    }
    return self;
}

- (void)showAnimation {
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3.0;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [_shapeLayer addAnimation:animation forKey:@"strokeEnd"];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
