

#import <Foundation/Foundation.h>

@interface RKData : NSObject

#pragma mark- frames
@property (assign) CGRect navigationBarFrame;
@property (assign) CGRect bodyViewFrame;
@property (assign) CGRect toolbarFrame;

@property (assign) CGRect aboutViewFrame;

#pragma mark- default
+ (id) data;

#pragma mark- dictionary
@property (strong,nonatomic) NSString *dictionaryPath;

//文件操作
- (BOOL)creatDictionary;
- (NSMutableDictionary *)dictionaryFromFile;
- (BOOL)saveDictionary:(NSMutableDictionary *)dic;

//功能性
- (NSInteger)volumeOfToday;
- (void)finishOneDrink;


#pragma mark- timeLimited
@property (strong,nonatomic) NSString *timeLimitedPath;
- (BOOL)isLimited;
- (NSString *)lastTime;


#pragma mark- tableViewCell
@property (strong,nonatomic) NSString *cellPath;
- (BOOL)creatArray;
- (NSMutableArray *)arrayFromFile;
- (BOOL)saveArray:(NSMutableArray *)array;

#pragma mark- helpView
@property (strong,nonatomic) NSString *helpViewPath;
- (BOOL)isHelped;


@end
