//
//  CustomGuideView.h
//  自定义引导页
//
//  Created by 崔志伟 on 2017/8/1.
//  Copyright © 2017年 崔志伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomGuideView : UIView
@property (nonatomic,strong) UIButton  * knowBtn ;
@property (nonatomic,copy) void(^knowBtnBlcok) () ;
+ (void)showStoreGuideView;
@end
