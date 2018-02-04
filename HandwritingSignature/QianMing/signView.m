//
//  signView.m
//  draw
//
//  Created by mac on 2017/5/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "signView.h"


@interface signView ()
@end

@implementation signView

- (NSMutableArray *)pointPaths{
    
    if (_pointPaths == nil) {
        _pointPaths = [NSMutableArray array];
        
    }
    return _pointPaths;
}
//当一个或者多个手指开始触摸视图的时候就会调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"begin");
    //    1.获取指头
    UITouch *touch = [touches anyObject];
    //    2.获取当前触摸的点
    CGPoint currentPoint = [touch locationInView:self];
    //    3.建立一个小的数组来记录这个移动形成路径(这个数组中记录都是点)(通过c实现)
    //    NSMutableArray *points = [NSMutableArray array];
    //
    //    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
    //    3.创建一条路径用来代替原来的数组(oc方式)
    UIBezierPath *path=  [UIBezierPath bezierPath];
    
    //    4.把建立的小数组放在大的路径数组中(c方式)
    //    4.用路径移动到起点
    //    [self.pointPaths addObject:points];
    [path moveToPoint:currentPoint];
    //    4.1把路径添加到数组中
    [self.pointPaths addObject:path];
    //    5.重绘
    [self setNeedsDisplay];
    
}

//当一个或者多个手指在视图上移动的时候就会调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"moved");
    //    1.获取手指
    UITouch *touch = [touches anyObject];
    //    2.获取当前触摸的点
    CGPoint currentPoint = [touch locationInView:self];
    //    3.用小的数组来记录当前移动的点
    //    3.1获取小的数组(c)
    //    3.1获取路径
    UIBezierPath *path =  [self.pointPaths lastObject];
    [path addLineToPoint:currentPoint];
    
    [self setNeedsDisplay];
    
}
//当一个或者多个手指离开视图的时候就会调用(手指离开不做操作)
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
    
}
//在这个方法中 ,我们拿到触摸形成的路径,进行绘制图形
- (void)drawRect:(CGRect)rect{
    //    0.设置颜色
    [[UIColor blackColor]set];
    //    1.遍历所有的路径,直接渲染
    for (UIBezierPath *path in self.pointPaths) {
        //       1.1 设置属性
        
        [path setLineWidth:5];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path stroke];
    }
}

- (void)clear{
    
    //    1.删除所有的元素
    [self.pointPaths removeAllObjects];
    //    2.重新绘制
    [self setNeedsDisplay];
}
    
    
    
@end
