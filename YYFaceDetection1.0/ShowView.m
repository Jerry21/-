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

- (void)drawImage
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, 0.0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGRect imageRect = self.bounds;
    CGContextDrawImage(ctx, imageRect, [UIImage imageNamed:@"xiaoming"].CGImage);
    CGContextRestoreGState(ctx);
}

- (void)drawRect:(CGRect)rect
{
    

    [self d];
}

- (void)d
{
    // 加载plist文件
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"1234" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path1];
    // 取出face数组
    NSArray *faceArray = dic[@"faces"];
    
    // 五官轮廓
    for (NSDictionary *item in faceArray)
    {
        // 脸部轮廓
//        [self drawFaceRectangle:item[@"face_rectangle"]];
        
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
        [self bigPoint:p];
    }
    
    [self lineWithDic:dic];
}

- (void)lineWithDic:(NSDictionary *)dic
{
    
    {
        CGPoint p1 = [self pointFromDic:dic[@"left_eyebrow_left_corner"]];
        CGPoint p2 = [self pointFromDic:dic[@"left_eyebrow_upper_left_quarter"]];
        CGPoint p3 = [self pointFromDic:dic[@"left_eyebrow_upper_right_quarter"]];
        CGPoint p4 = [self pointFromDic:dic[@"right_eyebrow_left_corner"]];
        CGPoint p5 = [self pointFromDic:dic[@"right_eyebrow_upper_right_quarter"]];
        CGPoint p6 = [self pointFromDic:dic[@"right_eyebrow_right_corner"]];
        CGPoint p7 = [self pointFromDic:dic[@"mouth_right_corner"]];
        CGPoint p8 = [self pointFromDic:dic[@"contour_chin"]];
        CGPoint p9 = [self pointFromDic:dic[@"mouth_left_corner"]];
        CGPoint p10 = [self pointFromDic:dic[@"left_eyebrow_left_corner"]];
        
        CGPoint p11 = [self pointFromDic:dic[@"left_eye_right_corner"]];
        CGPoint p12 = [self pointFromDic:dic[@"right_eye_left_corner"]];
        
        CGPoint p13 = [self pointFromDic:dic[@"nose_left"]];
        CGPoint p14 = [self pointFromDic:dic[@"nose_right"]];
        CGPoint p15 = [self pointFromDic:dic[@"nose_contour_lower_middle"]];
        
        CGPoint p16 = [self pointFromDic:dic[@"mouth_lower_lip_top"]];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:p1];
        [path addLineToPoint:p2];
        [path addLineToPoint:p3];
        [path addLineToPoint:p4];
        [path addLineToPoint:p5];
        [path addLineToPoint:p6];
        [path addLineToPoint:p7];
        [path addLineToPoint:p8];
        [path addLineToPoint:p9];
        [path addLineToPoint:p10];
        [path addLineToPoint:p13];
        [path addLineToPoint:p11];
        [path addLineToPoint:p15];
        [path addLineToPoint:p12];
        [path addLineToPoint:p14];
        [path addLineToPoint:p6];
        
        [path moveToPoint:p2];
        [path addLineToPoint:p13];
        
        [path moveToPoint:p3];
        [path addLineToPoint:p11];
        
        [path moveToPoint:p5];
        [path addLineToPoint:p14];
        
        [path moveToPoint:p4];
        [path addLineToPoint:p12];
        
        [path moveToPoint:p15];
        [path addLineToPoint:p13];
        [path addLineToPoint:p16];
        [path addLineToPoint:p8];
        
        [path moveToPoint:p15];
        [path addLineToPoint:p14];
        [path addLineToPoint:p16];
        
        [path moveToPoint:p13];
        [path addLineToPoint:p9];
        
        [path moveToPoint:p14];
        [path addLineToPoint:p7];
        
        
        
        [[UIColor redColor] setStroke];
    
//        [path strokeWithBlendMode:kCGBlendModeNormal alpha:0.5];
        [path stroke];
        
        
//        [self bigPoint:p1];
//        [self bigPoint:p2];
//        [self bigPoint:p3];
//        [self bigPoint:p4];
//        [self bigPoint:p5];
//        [self bigPoint:p6];
//        [self bigPoint:p7];
//        [self bigPoint:p8];
//        [self bigPoint:p9];
//        [self bigPoint:p10];
//        [self bigPoint:p11];
//        [self bigPoint:p12];
//        [self bigPoint:p13];
//        [self bigPoint:p14];
//        [self bigPoint:p15];
//        [self bigPoint:p16];
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
    CGFloat offert = 0.7;
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
