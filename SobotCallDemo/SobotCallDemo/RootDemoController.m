//
//  RootDemoController.m
//  SobotOrderSDKDemo
//
//  Created by zhangxy on 2022/5/17.
//

#import "RootDemoController.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import <SobotCallSDK/SobotCallSDK.h>
#import <SobotCommon/SobotCacheEntity.h>
#import <SobotCallSDK/SobotCallClient.h>
#import <SobotTelemarketingSDK/SobotTMHomeV6Controller.h>
#import <SobotTelemarketingSDK/SobotTMClient.h>
@interface RootDemoController ()<SobotTMClientDelegate>
@property(nonatomic,strong)  SobotTMHomeV6Controller *tmHomeVC;
@end

@implementation RootDemoController

- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                Title:(NSString *)title
        selectedImage:(NSString *)selectedImage
      unselectedImage:(NSString *)unselectedImage{
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;

    UINavigationController * navc5 = nil;
    _tmHomeVC = [[SobotTMHomeV6Controller alloc]init];
    _tmHomeVC.exitWhenTokenInvalided = YES;
    _tmHomeVC.isAddInTab = YES;
    [SobotTMClient getSobotTMClient].delegate = self;
    [self setTabBarItem:_tmHomeVC.tabBarItem Title:@"电销" selectedImage:@"root_menu2" unselectedImage:@"root_menu2_nor"];
    navc5 = [[UINavigationController alloc] initWithRootViewController:_tmHomeVC];
    navc5.navigationBarHidden = NO;
    
    
    ViewController * viewController = [[ViewController alloc]init];
    [self setTabBarItem:viewController.tabBarItem Title:@"设置" selectedImage:@"root_menu4" unselectedImage:@"root_menu4_nor"];
    UINavigationController * navc1 = [[UINavigationController alloc]initWithRootViewController:viewController];
    navc1.navigationBarHidden = YES;
    
    UINavigationBar * bar2 = [UINavigationBar appearance];
    bar2.barTintColor = [UIColor whiteColor];// 0x39B9C2
    
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromCallModeColor(SobotColorTextNav),NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromCallModeColor(SobotColorBanner),NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateSelected];
    self.viewControllers = @[navc5,navc1];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    if ([[UIDevice currentDevice].systemVersion doubleValue]>=15.0) {
        UITabBarAppearance *tabbarAppearance = [[UITabBarAppearance alloc] init];
        tabbarAppearance.backgroundColor = [UIColor whiteColor];
        self.tabBar.scrollEdgeAppearance = tabbarAppearance;
        self.tabBar.standardAppearance = tabbarAppearance;
        // 设置选中文字颜色 iOS13 中对应的label的属性 textColorFollowsTintColor 默认为true  iOS13之前的版本默认false
        self.tabBar.tintColor = UIColorFromCallModeColor(SobotColorBanner);
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
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
