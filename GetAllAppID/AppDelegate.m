//
//  AppDelegate.m
//  GetAllAppID
//
//  Created by bianruifeng on 2016/11/18.
//  Copyright © 2016年 bianruifeng. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
#import "NSObject_Ex.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


//可以参考学习： 
//http://blog.csdn.net/bianruifeng/article/details/51360206?locationNum=1&fps=1
//http://www.jianshu.com/p/6167b9ce7af8


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSMutableArray *allID = [[NSMutableArray alloc] init];
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    Class LSApplicationProxy_class = object_getClass(@"LSApplicationProxy");
    
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    
    NSArray *appList = [workspace  performSelector:@selector(allApplications)];
    

//    NSString *model = [UIDevice currentDevice].model;
    
    for (Class LSApplicationProxy in appList)
    {
        NSDictionary *dict = [LSApplicationProxy performSelector:@selector(properties_aps)];
        NSLog(@"%@",[dict objectForKey:@"applicationIdentifier"]);
        [allID addObject:[dict objectForKey:@"applicationIdentifier"]];
    }
    NSLog(@"%@",allID);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
