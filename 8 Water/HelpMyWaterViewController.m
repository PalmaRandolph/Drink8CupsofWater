//
//  HelpMyWaterViewController.m
//  8 Water
//
//  Created by 鑫 on 2018/11/7.
//  Copyright © 2018年 ruikaili. All rights reserved.
//

#import "HelpMyWaterViewController.h"

@interface HelpMyWaterViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MyWebViewKit;
@property (weak, nonatomic) IBOutlet UILabel *Loading;
@end

@implementation HelpMyWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.MyWebViewKit loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/PalmaRandolph/Drink8CupsofWater/issues"]]];
    self.MyWebViewKit.delegate=self;
    // Do any additional setup after loading the view.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _Loading.hidden=YES;
}
- (IBAction)backSettingAction:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
