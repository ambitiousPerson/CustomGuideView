//
//  CustomGuideView.m
//  自定义引导页
//
//  Created by 崔志伟 on 2017/8/1.
//  Copyright © 2017年 崔志伟. All rights reserved.
//

#import "CustomGuideView.h"

#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

@implementation CustomGuideView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self  = [super initWithFrame:frame]) {
        self.knowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.knowBtn setImage:[UIImage imageNamed:@"icon_myshop_btn_know"] forState:UIControlStateNormal];
        [self.knowBtn addTarget:self action:@selector(knowBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.knowBtn];
    }
    return self;
}

- (void)knowBtnAction{
    
    if (self.knowBtnBlcok) {
        self.knowBtnBlcok();
    }
}
+ (CustomGuideView *)showStoreGuideView{
    CustomGuideView *storeGuideView = [[CustomGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    storeGuideView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
    [kKeyWindow addSubview:storeGuideView];
    UIBezierPath *pathRect = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    UIBezierPath *pathRoundedRect = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((kScreen_Width/3)*2+15, kScreen_Height-140-130, (kScreen_Width/3-30), 130)];
    pathRoundedRect =  [pathRoundedRect bezierPathByReversingPath];
    [pathRect appendPath:pathRoundedRect];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = pathRect.CGPath;
    layer.backgroundColor = [UIColor redColor].CGColor;
    storeGuideView.layer.mask = layer;
    UIImage * storeGuideImg = [UIImage imageNamed:@"icon_myshop_line_triangle_r"];
    UIImageView *storeGuideLineImgView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreen_Width/3)*2+20 -storeGuideImg.size.width, kScreen_Height-140-100-storeGuideImg.size.height, storeGuideImg.size.width, storeGuideImg.size.height)];
    storeGuideLineImgView.image =storeGuideImg;
    [storeGuideView addSubview:storeGuideLineImgView];
    UILabel *contentLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(storeGuideLineImgView.frame)- storeGuideImg.size.height-20, kScreen_Width, 20)];
    contentLabel1.textAlignment = NSTextAlignmentCenter;
    contentLabel1.text = @"天长地久有时尽，此恨绵绵无绝期";
    contentLabel1.textColor = [UIColor whiteColor];
    [storeGuideView addSubview:contentLabel1];
    UILabel *contentLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(contentLabel1.frame)-50, kScreen_Width, 20)];
    contentLabel2.textAlignment = NSTextAlignmentCenter;
    contentLabel2.text = @"死生契阔，与子成说。执子之手，与子偕老。";
    contentLabel2.textColor = [UIColor whiteColor];
    [storeGuideView addSubview:contentLabel2];
    
    storeGuideView.knowBtn.frame = CGRectMake((kScreen_Width -118)/2,kScreen_Height-180 , 118, 60);
    __weak __block CustomGuideView * weakstoreGuideView = storeGuideView;
    storeGuideView.knowBtnBlcok = ^{
        [weakstoreGuideView removeFromSuperview];
        [self showStorePlaceGuideView];
    };
    
    return storeGuideView;
}
+ (void)showStorePlaceGuideView{
    CustomGuideView *storeGuideView = [[CustomGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    storeGuideView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.4];
    [kKeyWindow addSubview:storeGuideView];
    UIBezierPath *pathRect = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    UIBezierPath *pathRoundedRect = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(15, kScreen_Height-140,(kScreen_Width/3-30), 130)];
    pathRoundedRect =  [pathRoundedRect bezierPathByReversingPath];
    [pathRect appendPath:pathRoundedRect];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = pathRect.CGPath;
    layer.backgroundColor = [UIColor redColor].CGColor;
    storeGuideView.layer.mask = layer;
    UIImage * storeGuideImg = [UIImage imageNamed:@"icon_myshop_line_triangle_l"];
    UIImageView *storeGuideLineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(storeGuideImg.size.width/2+10, kScreen_Height-145-storeGuideImg.size.height, storeGuideImg.size.width, storeGuideImg.size.height)];
    storeGuideLineImgView.image =storeGuideImg;
    [storeGuideView addSubview:storeGuideLineImgView];
    UILabel *contentLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(storeGuideLineImgView.frame)- storeGuideImg.size.height-20, kScreen_Width, 20)];
    contentLabel1.textAlignment = NSTextAlignmentCenter;
    contentLabel1.text = @"两情若是久长时，又岂在朝朝暮暮。 ";
    contentLabel1.textColor = [UIColor whiteColor];
    [storeGuideView addSubview:contentLabel1];
    UILabel *contentLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(contentLabel1.frame)-50, kScreen_Width, 20)];
    contentLabel2.textAlignment = NSTextAlignmentCenter;
    contentLabel2.text = @"有美人兮，见之不忘，一日不见兮，思之如狂。";
    contentLabel2.textColor = [UIColor whiteColor];
    [storeGuideView addSubview:contentLabel2];
    
    storeGuideView.knowBtn.frame = CGRectMake((kScreen_Width -118)/2,kScreen_Height-180 , 118, 60);
    __weak __block CustomGuideView * weakstoreGuideView = storeGuideView;
    storeGuideView.knowBtnBlcok = ^{
        [weakstoreGuideView removeFromSuperview];
        [[NSUserDefaults standardUserDefaults] setObject:@"storeGuideView_Value" forKey:@"HLJStoreGuideView_Key"];
    };
}

@end
