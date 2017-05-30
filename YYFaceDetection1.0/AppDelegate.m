//
//  AppDelegate.m
//  YYFaceDetection1.0
//
//  Created by 叶俊有 on 2017/5/30.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    [FaceppAPI initWithApiKey:API_KEY andApiSecret:API_SECRET andRegion:0];
    
//    NSData *imageData = [NSData dataWithContentsOfFile:@"/Users/yejunyou/Desktop/timg3.jpg"];
//    FaceppResult *result = [[FaceppAPI detection] detectWithURL:nil orImageData:imageData];
//    
//    // 用方法2
////    FaceppResult *result = [[FaceppAPI group] deleteWithGroupName:nil orGroupId:nil];
//    
//    // detectLocalFileResult:
//    double img_width = [[result content][@"img_width"] doubleValue];
//    
//    //  - 获得第一张脸的face_id：
//    NSString *face_id = [result content][@"face"][0][@"face_id"];
//    
//    NSLog(@"img_width:%zd,face_id:%@",img_width,face_id);
//    
//    [FaceppAPI setDebugMode: TRUE];
    
//    NSString *imageURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496144617328&di=3b5fc33624512c3c331dddf821cff67f&imgtype=0&src=http%3A%2F%2Feasyread.ph.126.net%2FGj-7aw9xUqevk2wV8Hfjhg%3D%3D%2F8796093022317926862.jpg";
//    
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    NSString *urlString = @"https://api-cn.faceplusplus.com/facepp/v3/detect";
//    NSDictionary *params = @{@"api_key":API_KEY,
//                             @"api_secret":API_SECRET,
//                             @"image_url":imageURL,
//                             @"return_landmark": @(1)};
//    [mgr POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"success:%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"fails:%@",error);
//    }];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
