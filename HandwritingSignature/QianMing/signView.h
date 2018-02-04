//
//  signView.h
//  draw
//
//  Created by mac on 2017/5/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signView : UIView

@property(nonatomic,strong)NSMutableArray *pointPaths;
- (void)clear;
- (void)back;

@end
