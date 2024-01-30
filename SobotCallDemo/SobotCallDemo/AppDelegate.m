//
//  AppDelegate.m
//  SobotCallDemo
//
//  Created by lizh on 2022/8/25.
//

#import "AppDelegate.h"
#import <SobotCallSDK/SobotCallSDK.h>
#import <SobotCommon/SobotCacheEntity.h>
#import "RootDemoController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)switchRootViewController
{
    // 版本号相同：这次打开和上次打开的是同一个版本
    if (![SobotCallClient isLogin]) {
        [self goLogin];
    } else {
        [self goHome];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    SobotCallCacheEntity *config = [[SobotCallCacheEntity alloc] init];
    config.bundleName = @"SobotCall";
    config.languageTableName = @"SobotLocal";
    config.languagePathInBundle = @"Localizable";
    config.colorTableName = @"SobotColor";
    config.openApiHost = @"https://www.test.com";
//    config.absoluetelanguage = @"zh-Hans";
    SobotCallParameter *kitInfo = [[SobotCallParameter alloc]init];

    [SobotCallApi initWithConfig:config kitInfo:kitInfo result:^(NSInteger code, id  _Nullable obj, NSString * _Nullable msg) {

    }];
    
    [self switchRootViewController];
    return YES;
}

-(void)goLogin{
    LoginViewController * login = [[LoginViewController alloc] init];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:login];
    nav.navigationBarHidden=YES;
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController=nav;
}

-(void)goHome{
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = UIColor.whiteColor;
//    RootDemoController * tabBarController = [[RootDemoController alloc]init];
//    self.window.rootViewController = tabBarController;
////    self.window.rootViewController = viewController;
//    [self.window makeKeyWindow];
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController=[stryBoard instantiateInitialViewController];
}





@end
