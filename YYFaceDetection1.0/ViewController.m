//
//  ViewController.m
//  YYFaceDetection1.0
//
//  Created by 叶俊有 on 2017/5/30.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
//#import "AFNetworking.h"
//
//
//#define API_KEY @"FapRqpeyWXlvMe4OJ33NaXdk3IkRootI"
//#define API_SECRET @"MXGzZBNrmVvOrJt5Ezza5P-KQoJooI3c"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSString *imageURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496164742657&di=cd1b186fe60dfa4872554e6c1d0d6475&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F004ikHdjgy6GGy1bKqW36%26690";
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSString *urlString = @"https://api-cn.faceplusplus.com/facepp/v3/detect";
    NSDictionary *params = @{@"api_key":API_KEY,
                             @"api_secret":API_SECRET,
                             @"image_url":imageURL,
                             @"return_landmark": @(1)};
    [mgr POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *rpsDic ) {
        NSString *path = @"/Users/yejunyou/Desktop/123.plist";
        [rpsDic writeToFile:path atomically:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fails:%@",error);
    }];
     */
    
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496164742657&di=cd1b186fe60dfa4872554e6c1d0d6475&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F004ikHdjgy6GGy1bKqW36%26690"];
//    [self.imageView sd_setImageWithURL:url];
    self.imageView.hidden =YES;
}


@end
