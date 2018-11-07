
#import "RKData.h"

@implementation RKData
+ (id)data
{
    RKData *data = [[RKData alloc]init];

    CGRect screen = [[UIScreen mainScreen]bounds];
    
    //navigationBarFrame
    NSInteger navigationBarHeight = 64;
    [data setNavigationBarFrame:CGRectMake(0, 0, screen.size.width, navigationBarHeight)];
    
    //toolbarFrame
    NSInteger toolbarHeight = 48;
    [data setToolbarFrame:CGRectMake(0, screen.size.height - toolbarHeight, screen.size.width, toolbarHeight)];
    
    //bodyViewFrame
    [data setBodyViewFrame:CGRectMake(0, 0 + navigationBarHeight + 1, screen.size.width , screen.size.height - navigationBarHeight - toolbarHeight - 2)];
    
    //aboutViewFrame
    [data setAboutViewFrame:CGRectMake(0, 0 + navigationBarHeight, screen.size.width, screen.size.height)];
    
    //dictionaryPath
    [data setDictionaryPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"data.plist"]];
    
    //timeLimitedPath
    [data setTimeLimitedPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"limited.plist"]];
    
    //schedulePath
    [data setCellPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"cell.plist"]];
    
    //helpViewPath
    [data setHelpViewPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"help.plist"]];
    
    
    return data;
}

#pragma mark- dictionary
- (BOOL)creatDictionary
{
    //文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    //创建文件
    if (![fileManager fileExistsAtPath:_dictionaryPath])
    {
        //创建字典
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        //添加记录
        for (int i = -30; i < 365*5; i++) {
            //当前时区时间
            NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
            
            //基于当前时区，过去或未来的时间
            NSString *dateStr = [[[NSDate dateWithTimeInterval:3600*24*i sinceDate:date]description]substringToIndex:10];
            
            //写入字典
            [dic setValue:@"0" forKey:dateStr];
        }
        //写入文件
        [dic writeToFile:_dictionaryPath atomically:YES];
        return YES;
    }
    return NO;
}

- (NSMutableDictionary *)dictionaryFromFile
{
    //读取字典
    return [NSMutableDictionary dictionaryWithContentsOfFile:_dictionaryPath];
}

- (BOOL)saveDictionary:(NSMutableDictionary *)dic
{
    //保存字典
    return [dic writeToFile:_dictionaryPath atomically:YES];
}

- (NSInteger)volumeOfToday
{
    //读取字典
    NSMutableDictionary *dic = [self dictionaryFromFile];
    
    //当前时区时间
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
    
    //基于当前时区
    NSString *dateStr = [[[NSDate dateWithTimeInterval:0 sinceDate:date]description]substringToIndex:10];
    
    //返回今天的喝水量
    return [dic[dateStr] intValue];
}

- (void)finishOneDrink
{
    //获取今天喝水量
    NSInteger volume = [self volumeOfToday];
    
    //当前时区时间
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
    
    //基于当前时区
    NSString *dateStr = [[[NSDate dateWithTimeInterval:0 sinceDate:date]description]substringToIndex:10];
    
    //读取字典
    NSMutableDictionary *dic = [self dictionaryFromFile];
    
    //修改字典
    [dic setValue:[NSString stringWithFormat:@"%ld",volume + 1] forKey:dateStr];
    
    //保存字典
    [self saveDictionary:dic];
}
#pragma mark- timeLimited
- (BOOL)isLimited;
{
    //文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    //文件不存在，即允许马上finish
    if (![fileManager fileExistsAtPath:_timeLimitedPath])
    {
        //当前时区时间
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
        
        //压缩当前时间，写入文件
        [NSKeyedArchiver archiveRootObject:date toFile:_timeLimitedPath];
        return YES;
    }
    
    //文件存在，解压，读取文件，转换成对象，获取上一次finish的时间
    NSDate *oldDate = (NSDate *)[NSKeyedUnarchiver unarchiveObjectWithFile:_timeLimitedPath];
    
    //将上一次finish时间，往前推1小时
    NSDate *oldDateAddOneHour = [NSDate dateWithTimeInterval:3600 sinceDate:oldDate];
    
    //当前时区时间
    NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
    
    //比较当前时间，和，旧时间加上1小时，返回较迟的时间，若返回的世间是当前时间，则允许finish
    if ([nowDate isEqualToDate:[nowDate laterDate:oldDateAddOneHour]]) {
        //压缩当前时间，写入文件
        [NSKeyedArchiver archiveRootObject:nowDate toFile:_timeLimitedPath];
        //允许YES
        return YES;
    }
    
    //时间未到，则NO
    return NO;
}

- (NSString *)lastTime
{
    //文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    //文件不存在
    if (![fileManager fileExistsAtPath:_timeLimitedPath])
    {
        //当前时区时间
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
        
        //压缩当前时间，写入文件
        [NSKeyedArchiver archiveRootObject:date toFile:_timeLimitedPath];
        
        //返回当前时间
        return [[date description]substringWithRange:NSRangeFromString(@"11,5")];
    }
    
    //文件存在，解压，读取文件，转换成对象，获取上一次的时间
    return [[(NSDate *)[NSKeyedUnarchiver unarchiveObjectWithFile:_timeLimitedPath] description]substringWithRange:NSRangeFromString(@"11,5")];
}

#pragma mark- tableViewCell
- (BOOL)creatArray
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Reminder me",
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             [NSDate date],
                             @"Help",
                             @"About",
                             @"Give a Review",nil];
    return YES;
}
- (NSMutableArray *)arrayFromFile
{
    NSMutableArray *array = nil;
    return array;
}
- (BOOL)saveArray:(NSMutableArray *)array
{
    return YES;
}


#pragma mark- helpView
- (BOOL)isHelped
{
    //文件管理对象
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    //文件不存在，显示帮助画面
    if (![fileManager fileExistsAtPath:_helpViewPath])
    {
        [fileManager createFileAtPath:_helpViewPath contents:nil attributes:nil];
        return NO;
    }
    
    //文件存在，不显示帮助画面
    return YES;
}

@end
