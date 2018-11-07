//
//  customToolbar.m
//  Sport Manager
//
//  Created by RyanLI on 14-4-3.
//  Copyright (c) 2014年 ruikaili. All rights reserved.
//

#import "RKToolbar.h"

@implementation RKToolbar

+ (id)toolbarWithFrame:(CGRect)frame Target:(id)target
{
    RKToolbar *toolbar = [[RKToolbar alloc]initWithFrame:frame];
    
    //设置toolbar的style
    [toolbar setBarStyle:UIBarStyleDefault];
    
    //调整items
    UIBarButtonItem *fixed1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixed1 setWidth:30];
    
    UIBarButtonItem *fixed2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixed2 setWidth:20];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //按钮    *******************这里需要优化*****************
    UIBarButtonItem *btn_water = [[UIBarButtonItem alloc]initWithTitle:@"Water" style:UIBarButtonItemStylePlain target:target action:@selector(water)];
    
    UIBarButtonItem *btn_total = [[UIBarButtonItem alloc]initWithTitle:@"Total" style:UIBarButtonItemStylePlain target:target action:@selector(total)];
    
    UIBarButtonItem *btn_more = [[UIBarButtonItem alloc]initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:target action:@selector(setting)];
    
    //按钮array
    NSArray *items = [[NSArray alloc]initWithObjects:
                      fixed1,
                      btn_water,
                      flexible,
                      btn_total,
                      flexible,
                      btn_more,
                      fixed2,
                      nil];
    
    //设置按钮项数据
    [toolbar setItems:items];
    return toolbar;
}

@end
