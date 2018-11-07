//
//  RKAboutView.m
//  8 Water
//
//  Created by RyanLI on 14-4-6.
//  Copyright (c) 2014年 ruikaili. All rights reserved.
//

#import "RKAboutView.h"

@implementation RKAboutView
+ (id)aboutViewWithFrame:(CGRect)frame
{
    //aboutView
    RKAboutView *aboutView = [[RKAboutView alloc]initWithFrame:frame];
    [aboutView setBackgroundColor:[UIColor whiteColor]];
    
    //icon尺寸
    NSInteger iconWidth = 80;
    NSInteger iconHeight = 80;
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - iconWidth)/2, 50,
                                                                     iconWidth,
                                                                     iconHeight)];
    [icon setImage:[UIImage imageNamed:@"icon-80x80.png"]];
    
    //claim尺寸
    NSInteger textViewWidth = 320;
    NSInteger textViewHeight = 800;
    
    UITextView *claim = [[UITextView alloc]initWithFrame:CGRectMake(0, iconHeight + 50 , textViewWidth, textViewHeight)];
    
    [claim setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:15]];
    [claim setTextAlignment:NSTextAlignmentCenter];
    [claim setEditable:NO];
    
    //claim文本
    [claim setText:@"8 Water\n\n"];
    [claim insertText:@"Version 1.0\n\n\n"];
    [claim insertText:@"Copyright:@RUI KAI LI\n"];
    [claim insertText:@"Email:ryanlrk@gmail.com\n"];
    [claim insertText:@"Tel:+86 18933 189363\n"];
    
    //添加到about
    [aboutView addSubview:icon];
    [aboutView addSubview:claim];
    
    return aboutView;
}

@end
