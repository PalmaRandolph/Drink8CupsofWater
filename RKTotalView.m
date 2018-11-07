//
//  RKTotalView.m
//  8 Water
//
//  Created by RyanLI on 14-4-3.
//  Copyright (c) 2014年 ruikaili. All rights reserved.
//

#import "RKTotalView.h"

@implementation RKTotalView

+ (id)totalViewWithFrame:(CGRect)frame Dictionary:(NSMutableDictionary *)dic
{
    //totalView
    RKTotalView *view = [[RKTotalView alloc]initWithFrame:frame];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    //年份标签
    UILabel *yearLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, frame.size.width, 30)];
    [yearLabel setText:[[[NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]]description]substringToIndex:4]];
    [yearLabel setTextColor:[UIColor blackColor]];
    [yearLabel setTextAlignment:NSTextAlignmentCenter];
    [yearLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:30]];
    
    //坐标轴尺寸
    NSInteger xyWidth = 320;
    NSInteger xyHeight = 254;
    
    //坐标轴与toolbar距离
    NSInteger xyToToolbar = 45;
    
    //坐标轴
    UIImageView *xy = [[UIImageView alloc]initWithFrame:CGRectMake(0, frame.size.height - xyHeight - xyToToolbar, xyWidth, xyHeight)];
    [xy setImage:[UIImage imageNamed:@"xy.png"]];
    
    
    //滚动视图与屏幕左边的距离
    NSInteger scrollToLeft = 14;
    
    //滚动视图尺寸
    NSInteger scrollWidth = frame.size.width - scrollToLeft;
    NSInteger scrollHeight = frame.size.height;
    
    //滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(scrollToLeft, 0, scrollWidth, scrollHeight)];
    
    //滚动长度
    NSInteger contentWidth = scrollWidth * 5;
    
    //滚动尺寸
    [scrollView setContentSize:CGSizeMake(contentWidth, 0)];
    
    //设置滚动初始位置
    [scrollView setContentOffset:CGPointMake(contentWidth - scrollWidth, 0)];
    
    //隐藏滚动条
    [scrollView setShowsHorizontalScrollIndicator:NO];
    
    
    //元素尺寸
    NSInteger smallVolumeWidth = 40;
    NSInteger smallVolumeHeight = 20;
    
    //元素间隔
    NSInteger betweenX = 10;
    NSInteger betweenY = 10;
    
    //元素数量
    NSInteger days = 30;
    NSInteger volume = 0;
    
    //元素与toolbar的距离
    NSInteger volumeToToolbar = 50;
    
    
    //日期标签尺寸
    NSInteger dateLabelWidth = 40;
    NSInteger dateLabelHeight = 20;
    
    //日期与toolbar的距离
    NSInteger dateToToolbar = 20;
    
    //生成统计表
    for (int i = 0 ; i < days ; i++) {
        //当前时区时间
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
        
        //获取日期，倒数
        NSString *dateStr = [[[NSDate dateWithTimeInterval:-3600*24*i sinceDate:date]description]substringToIndex:10];
        
        //从字典获取数量
        volume = [dic[dateStr]intValue];
        
        for (int j = 0; j < volume; j++) {
            
            //设置元素
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:
                                      CGRectMake(contentWidth - smallVolumeWidth - i*(smallVolumeWidth + betweenX) - 10,
                                                 frame.size.height - smallVolumeHeight - j*(smallVolumeHeight + betweenY) - volumeToToolbar,
                                                 smallVolumeWidth,
                                                 smallVolumeHeight)];
            [imageView setImage:[UIImage imageNamed:@"volume_total.png"]];
            
            //添加到滚动视图
            [scrollView addSubview:imageView];
            
        }
        
        //设置日期标签
        UILabel *dateLabel = [[UILabel alloc]initWithFrame:
                              CGRectMake(contentWidth - smallVolumeWidth - i*(smallVolumeWidth + betweenX) - 10,
                                         frame.size.height - dateLabelHeight - dateToToolbar,
                                         dateLabelWidth,
                                         dateLabelHeight)];
        
        [dateLabel setText:[dateStr substringFromIndex:5]];
        [dateLabel setTextColor:[UIColor grayColor]];
        [dateLabel setTextAlignment:NSTextAlignmentCenter];
        [dateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:13]];
        
        //添加到滚动视图
        [scrollView addSubview:dateLabel];
    }
    
    //添加到父视图
    [view addSubview:xy];
    [view addSubview:yearLabel];
    [view addSubview:scrollView];
    
    return view;
}

@end
