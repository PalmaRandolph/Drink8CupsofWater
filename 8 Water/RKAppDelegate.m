
#import "RKAppDelegate.h"
#import "RKViewController.h"

@implementation RKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  
    
    //获取控制器
    RKViewController *rkv = (RKViewController *)[[self window]rootViewController];
    
    //在进入屏幕前判断 switch状态
    if([[[UIApplication sharedApplication]scheduledLocalNotifications]count] != 0)[[rkv aSwitch]setOn:YES];
    else [[rkv aSwitch]setOn:NO];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
