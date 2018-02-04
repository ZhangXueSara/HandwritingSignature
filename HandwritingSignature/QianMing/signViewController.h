//
//  signViewController.h
//  draw
//
//  Created by mac on 2017/5/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol signViewControllerDelegate <NSObject>

- (void)showImage:(UIImage *)image;

@end




@interface signViewController : UIViewController

//设置代理  弱引用
@property (nonatomic,assign) id <signViewControllerDelegate> delegate;




@end
