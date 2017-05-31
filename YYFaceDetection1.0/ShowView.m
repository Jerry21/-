//
//  ShowView.m
//  YYFaceDetection1.0
//
//  Created by 叶俊有 on 2017/5/30.
//  Copyright © 2017年 yejunyou. All rights reserved.
//

#import "ShowView.h"
#import "AFNetworking.h"


#define API_KEY @"FapRqpeyWXlvMe4OJ33NaXdk3IkRootI"
#define API_SECRET @"MXGzZBNrmVvOrJt5Ezza5P-KQoJooI3c"

@implementation ShowView



void drawImage(CGContextRef context, CGImageRef image , CGRect rect){
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    CGContextDrawImage(context, rect, image);
    
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    //翻转起来---上下颠倒
    CGContextTranslateCTM(ctx, 0.0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    ////假设想在10,30,80,80的地方绘制,颠倒过来后的Rect应该是 10, self.bounds.size.height - 110, 80, 80
    CGRect imageRect = self.bounds;//CGRectMake(10, self.bounds.size.height - 110, 80, 80);
    CGContextDrawImage(ctx, imageRect, [UIImage imageNamed:@"xiaoming"].CGImage);
    CGContextRestoreGState(ctx);
    
    UIImageView *iv;
    
    CGContextDrawImage(ctx, imageRect, iv.image.CGImage);
    
    //字体在iOS7中被废除了,移入CoreText框架中,以后再详细讨论.
//    [@"这是一个飞船" drawAtPoint:CGPointMake(10, 120) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    UIImage *image = [UIImage imageNamed:@"xaioming"];
////    CGContextDrawImage(context, self.bounds, [image CGImage]);
////    CGContextFillPath(context);
//    
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    drawImage(context, image.CGImage, self.bounds);
    
    [self d];
    /*
    NSTimeInterval date1 = [[NSDate date] timeIntervalSince1970];
    NSString *imageURL = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496164742657&di=cd1b186fe60dfa4872554e6c1d0d6475&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F004ikHdjgy6GGy1bKqW36%26690";
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSString *urlString = @"https://api-cn.faceplusplus.com/facepp/v3/detect";
    NSDictionary *params = @{@"api_key":API_KEY,
                             @"api_secret":API_SECRET,
                             @"image_url":imageURL,
                             @"return_landmark": @(1)};
    [mgr POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *rpsDic ) {
        NSTimeInterval date2 = [[NSDate date] timeIntervalSince1970];
        NSLog(@"NSTimeInterval:%f",date2 - date1);
        
        
        NSString *path = @"/Users/yejunyou/Desktop/1234.plist";
        [rpsDic writeToFile:path atomically:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fails:%@",error);
        NSTimeInterval date2 = [[NSDate date] timeIntervalSince1970];
        NSLog(@"NSTimeInterval2222:%f",date2 - date1);
    }];
     */
}

- (void)d
{
    // 加载plist文件
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Face" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path1];
    // 取出face数组
    NSArray *faceArray = dic[@"faces"];
    
    // 五官轮廓
    for (NSDictionary *item in faceArray)
    {
        // 脸部轮廓
        [self drawFaceRectangle:item[@"face_rectangle"]];
        
        // 五官轮廓
        [self contourWithDic:item[@"landmark"]];
    }
}

- (void)contourWithDic:(NSDictionary *)dic
{
    for (NSString *key in dic)
    {
        NSDictionary *pointDict = dic[key];
        CGPoint p = [self pointFromDic:pointDict];
//        CGPoint startP  = [self lineP1:p p2:p];
        [self bigPoint:p];
    }
}

- (void)mouthWithDic:(NSDictionary *)dic
{
    
}

- (void)noseWithDic:(NSDictionary *)dic
{
    for (NSDictionary *itemDic in dic)
    {
        NSDictionary *pointDict = dic[itemDic];
        
        [self bigPoint:[self pointFromDic:pointDict]];
    }
}


//
- (CGPoint)pointFromDic:(NSDictionary *)dic
{
    NSNumber *x1 = dic[@"x"];
    NSNumber *y1 = dic[@"y"];
    return CGPointMake(x1.floatValue, y1.floatValue);
}

- (void)lineWithP1:(CGPoint)p1 p2:(CGPoint)p2
{
    [self bigPoint:p1];
    [self bigPoint:p2];
}


- (CGPoint)lineP1:(CGPoint)p1 p2:(CGPoint)p2
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path stroke];
    return p1;
}

- (CGPoint)bigPoint:(CGPoint)p
{
    CGFloat offert = 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(p.x - offert, p.y - offert, offert *2, offert * 2)];
    [[UIColor redColor] setFill];
    [path stroke];
    return p;
}

- (void)drawKeyPoint1:(NSDictionary *)point1 point2:(NSDictionary *)point2
{
    NSNumber *x1 = point1[@"x"];
    NSNumber *y1 = point1[@"y"];
    CGPoint startPoint = CGPointMake(x1.floatValue, y1.floatValue);
    
    NSNumber *x2 = point2[@"x"];
    NSNumber *y2 = point2[@"y"];
    CGPoint endPoint = CGPointMake(x2.floatValue+1, y2.floatValue+1);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    [[UIColor redColor] setFill];
    [path stroke];
}


- (void)drawKeyPoint:(NSDictionary *)kpoint
{
    NSNumber *x = kpoint[@"x"];
    NSNumber *y = kpoint[@"y"];
    CGPoint point1 = CGPointMake(x.floatValue, y.floatValue);
    CGPoint point2 = CGPointMake(x.floatValue+1, y.floatValue+1);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [[UIColor redColor] setFill];
    [path stroke];
}

// 脸部框框
- (void)drawFaceRectangle:(NSDictionary *)rectangle
{
    CGFloat top = [rectangle[@"top"] floatValue];
    CGFloat left = [rectangle[@"left"] floatValue];
    CGFloat width = [rectangle[@"width"] floatValue];
    CGFloat height = [rectangle[@"height"] floatValue];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(left, top, width, height)];
    [[UIColor redColor] setStroke];
    [path stroke];
}
@end
