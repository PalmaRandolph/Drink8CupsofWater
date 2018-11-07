//
//  RKWaterView.h
//  8 Water
//
//  Created by RyanLI on 14-4-3.
//  Copyright (c) 2014年 ruikaili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKWaterView : UIView

//初始化
+ (id)waterViewWithFrame:(CGRect)frame Volumes:(NSInteger)volumes Target:(id)target;
//刷新
- (void)refreshVolumes:(NSInteger)volumes;

@end

