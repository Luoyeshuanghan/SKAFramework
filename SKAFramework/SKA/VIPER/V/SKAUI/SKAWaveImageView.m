//
//  SKAUploadImageView.m
//  ios 动画
//
//  Created by JZZ on 2017/3/2.
//  Copyright © 2017年 tepusoft. All rights reserved.
//

#import "SKAWaveImageView.h"
@interface SKAWaveImageView(){
    CGFloat waveA;//水纹振幅
    CGFloat waveW ;//水纹周期
    CGFloat offsetX; //位移
    CGFloat currentK; //当前波浪高度Y
    CGFloat waveSpeed;//水纹速度
    CGFloat waterWaveWidth; //水纹宽度
    UILabel * lb_number;
    int max_progress;
}
@property (nonatomic, strong) CADisplayLink * waveDisplaylink;
@property (nonatomic, strong) CAShapeLayer * firstWaveLayer;
@property (nonatomic, strong) UIColor * firstWaveColor;
@end

@implementation SKAWaveImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initWave];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWave];
    }
    return self;
}

- (void)initWave{
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds  = YES;
    
    lb_number = ({
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        lb.font = [UIFont systemFontOfSize:self.frame.size.width/3];
        lb.textColor = [UIColor whiteColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb;
    });
    [self addSubview:lb_number];
}

- (void)setKValue:(int)k{
    lb_number.text = [NSString stringWithFormat:@"%d%%", k];
    k = 100 - k;
    currentK = self.frame.size.height/100.0*k;
}

- (void)endProgress{
    lb_number.text = @"";
    waveSpeed = 0;
    currentK = self.frame.size.height * 2;
    waveW = 0;
}

-(void)setUp{
    //设置波浪的宽度
    waterWaveWidth = self.frame.size.width;
    //设置波浪的颜色
    self.firstWaveColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:.85];
    //设置波浪的速度
    //    waveSpeed = 0.8/M_PI;
    
    //设置波浪流动速度
    waveSpeed = 0.1;
    //设置振幅
    waveA = 2;
    //设置周期
    waveW = 1/30.0;
    //设置波浪纵向位置
    currentK = self.frame.size.height;//屏幕居中
    
    //初始化layer
    if (self.firstWaveLayer == nil) {
        //初始化
        self.firstWaveLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.firstWaveLayer.fillColor = self.firstWaveColor.CGColor;
        //设置边缘线的颜色
        //        self.firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
//        self.firstWaveLayer.lineWidth = 4.0;
        self.firstWaveLayer.strokeStart = 0.0;
        self.firstWaveLayer.strokeEnd = 0.8;
        [self.layer addSublayer:self.firstWaveLayer];
        //启动定时器
        self.waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
        [self.waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
    }
    __block int time = 0; //倒计时时间
    
    NSString * queue_name = [NSString stringWithFormat:@"wave_%p", self];
    char queue_name_char[100];
    strcpy(queue_name_char, (char *)[queue_name UTF8String]);
    dispatch_queue_t queue= dispatch_queue_create(queue_name_char, DISPATCH_QUEUE_CONCURRENT);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),0.03*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (time >= 100){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self endProgress];
            });
            dispatch_source_cancel(_timer);
        } else if (time <= max_progress){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setKValue:time];
            });
            ++ time;
        }
    });
    dispatch_resume(_timer);
}

-(void)getCurrentWave:(CADisplayLink *)displayLink{
    //实时的位移
    offsetX += waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

-(void)setCurrentFirstWaveLayerPath{
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    for (NSInteger x = 0.0f; x<=waterWaveWidth; x++) {
        //正玄波浪公式
        y = waveA * sin(waveW * x+ offsetX)+currentK;
        //将点连成线
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    self.firstWaveLayer.path = path;
    CGPathRelease(path);
}

/**
 初始化
 */
- (void)initProgress{
    lb_number.text = @"";
    max_progress = 0;
    currentK = 0;
    [self setUp];
}

- (void)setProgress:(int)progress{
    max_progress = progress;
}

@end
