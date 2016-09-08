//
//  FPSDisplay.m
//  FPSDisplay
//
//  Created by Mr.LuDashi on 16/9/8.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "FPSDisplay.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface FPSDisplay ()
@property (strong, nonatomic) UILabel *displayLable;
@property (strong, nonatomic) CADisplayLink *link;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSTimeInterval lastTime;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIFont *subFont;
@end

@implementation FPSDisplay

+ (instancetype)shareFPSDisplay {
    static FPSDisplay *shareDisplay;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareDisplay = [[FPSDisplay alloc] init];
    });
    
    return shareDisplay;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initDisplayLabel];
    }
    return self;
}

- (void)initDisplayLabel {
    CGRect frame = CGRectMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 50, 80, 30);
    self.displayLable = [[UILabel alloc] initWithFrame: frame];
    
    self.displayLable.layer.cornerRadius = 5;
    self.displayLable.clipsToBounds = YES;
    self.displayLable.textAlignment = NSTextAlignmentCenter;
    self.displayLable.userInteractionEnabled = NO;
    self.displayLable.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
    
    _font = [UIFont fontWithName:@"Menlo" size:14];
    if (_font) {
        _subFont = [UIFont fontWithName:@"Menlo" size:4];
    } else {
        _font = [UIFont fontWithName:@"Courier" size:14];
        _subFont = [UIFont fontWithName:@"Courier" size:4];
    }
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.displayLable];
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    self.displayLable.text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    self.displayLable.textColor = color;
}

- (void)dealloc {
    [_link invalidate];
}
@end
