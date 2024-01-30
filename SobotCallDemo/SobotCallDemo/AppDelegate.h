//
//  AppDelegate.h
//  SobotCallDemo
//
//  Created by lizh on 2022/8/25.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong)UIWindow *window;

- (void)switchRootViewController;

-(void)goLogin;

@end

