//
//  signViewController.m
//  draw
//
//  Created by mac on 2017/5/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "signViewController.h"
#import "signView.h"
#import "UIImage+Extension.h"
@interface signViewController ()

@property(nonatomic,strong)UIView *mainShowView;
@property(nonatomic,strong)UIView *tishiView;
@property(nonatomic,strong)UIButton *chongxie;
@property(nonatomic,strong)UIButton *saveBtn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,assign)CGPoint lastPoint;
@property(nonatomic,assign)BOOL isSwiping;
@property(nonatomic,strong)NSMutableArray * xPoints;
@property(nonatomic,strong)NSMutableArray * yPoints;
@property(nonatomic,strong)signView *signview;

@end
@implementation signViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainShowView = [[UIView alloc]initWithFrame:CGRectMake(25  ,33.5, self.view.frame.size.width - 50  ,  self.view.frame.size.height - 67)];
    self.mainShowView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainShowView];

    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(48 , 27  , 300, self.mainShowView.frame.size.height - 54  )];
    bgView.backgroundColor = [UIColor colorWithRed:220/255.0 green:228/255.0 blue:232/255.0 alpha:1.0];
    [self.mainShowView addSubview:bgView];
    
    self.signview = [[signView alloc]initWithFrame:CGRectMake(48 , 27  , 300, self.mainShowView.frame.size.height - 54)];
    self.signview.backgroundColor =[UIColor clearColor];
    [self.mainShowView addSubview:self.signview];
    
    self.chongxie= [[UIButton alloc]initWithFrame:CGRectMake(-30 , 175.5  , 110  , 35)];
    [self.chongxie setTitle:@"重 写" forState:UIControlStateNormal];
    [self.chongxie addTarget:self action:@selector(chongxieBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.chongxie.transform=CGAffineTransformMakeRotation(M_PI/2);

    self.chongxie.backgroundColor = [UIColor blueColor];
    [self.mainShowView addSubview: self.chongxie];
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(- 30, 385.5  , 110  , 35 )];
    [self.saveBtn setTitle:@"保 存" forState:UIControlStateNormal];
    [self.saveBtn addTarget:self action:@selector(saveBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.saveBtn.transform=CGAffineTransformMakeRotation(M_PI/2);
    self.saveBtn.backgroundColor = [UIColor blueColor];
    [self.mainShowView addSubview:self.saveBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)chongxieBtnDidClick:(UIButton *)sender{
    [self.signview clear];
}

-(void)saveBtnDidClick:(UIButton *)sender{
    self.saveBtn.userInteractionEnabled = NO;
    self.chongxie.userInteractionEnabled = NO;
    self.signview.userInteractionEnabled = NO;
    //有签名
    if (self.signview.pointPaths.count != 0) {
        UIImage *newImage = [UIImage rendImageWithView:self.signview];
        [self dismiss];
        if([self.delegate respondsToSelector:@selector(showImage:)]){
            [self.delegate showImage:newImage];
        }
    }else{
        //无内容提示
    }
}
@end
