

#import <UIKit/UIKit.h>

//Data
#import "RKData.h"

//View
#import "RKNavigationBar.h"
#import "RKToolbar.h"
#import "RKWaterView.h"
#import "RKTotalView.h"
#import "RKSettingView.h"
#import "RKHelpView.h"
#import "RKAboutView.h"


@interface RKViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UINavigationBarDelegate>
//数据
@property (strong,nonatomic) RKData *data;

//视图
@property (strong,nonatomic) RKNavigationBar *navigationBar;
@property (strong,nonatomic) UINavigationItem *aboutItem;
@property (strong,nonatomic) RKToolbar *toolbar;

@property (strong,nonatomic) RKWaterView *waterView;
@property (strong,nonatomic) RKTotalView *totalView;
@property (strong,nonatomic) RKSettingView *settingView;

@property (strong,nonatomic) UIScrollView *aboutView;
@property (strong,nonatomic) UISwitch *aSwitch;

@end
