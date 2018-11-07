//
//  RKHelpView.m
//  8 Water
//
//  Created by RyanLI on 14-4-6.
//  Copyright (c) 2014年 ruikaili. All rights reserved.
//

#import "RKHelpView.h"

@implementation RKHelpView
+ (id)helpView
{
    //获得主屏幕尺寸
    CGRect screen = [[UIScreen mainScreen]bounds];
    
    //帮助图片名
    NSArray *namesOfImage = [NSArray arrayWithObjects:
                             @"help1-1242x2208.png",
                             @"help2-1242x2208.png",
                             @"help3-1242x2208.png",nil];

//    if(screen.size.height == 568)
//    {
//        namesOfImage = [NSArray arrayWithObjects:
//                        @"help0-640x1136.png",
//                        @"help1-640x1136.png",
//                        @"help2-640x1136.png",nil];
//    }
    
    //帮助图片张数
    NSInteger imageCout = 3;
    
    //帮助图片尺寸
    NSInteger imageWidth = screen.size.width;
    NSInteger imageHeight = screen.size.height;
    
    //创建帮助视图
    RKHelpView *help = [[RKHelpView alloc]initWithFrame:screen];
    [help setBackgroundColor:[UIColor whiteColor]];
    
    //创建scroll视图
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:screen];
    
    //设置scroll视图可滚动长度 = 总图片长度
    [scroll setContentSize:CGSizeMake(imageWidth * imageCout, 0)];
    
    //设置分页
    [scroll setPagingEnabled:YES];
    
    //往scroll视图添加图片
    for (int i = 0; i < imageCout; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(screen.origin.x + i * imageWidth,
                                                                          screen.origin.y ,
                                                                          imageWidth,
                                                                          imageHeight)];
        [image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",namesOfImage[i]]]];
        [scroll addSubview:image];
    }
    
    //开始按钮尺寸
    NSInteger btnWidth = 120;
    NSInteger btnHeight = 50;
    
    //按钮距离底部距离
    NSInteger btnTobottom = 150;
    
    //创建开始按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(imageWidth * (imageCout -1) + (screen.size.width - btnWidth)/2,
                                                              screen.size.height - btnHeight - btnTobottom,
                                                              btnWidth,
                                                              btnHeight)];
    [btn addTarget:help action:@selector(removeHelp) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_finish.png"] forState:UIControlStateNormal];
    
    //将按钮添加到scroll
    [scroll addSubview:btn];
    
    //将scroll添加到help
    [help addSubview:scroll];
    
    //同时将help返回给自己,用于begin将自己删除
    [help setHelp:help];
    
    return help;
}

- (void)removeHelp
{
    //移除帮助视图
    [_help removeFromSuperview];
}

@end
