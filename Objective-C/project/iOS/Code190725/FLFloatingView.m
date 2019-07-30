//
//  Copyright (c) 2019 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FLFloatingView.h"

typedef void(^Block1)(NSInteger);
typedef void(^Block2)(UIButton *);

@interface FLFloatingView ()

@property (nonatomic) CGPoint startLocation;
@property (nonatomic) BOOL left;
@property (nonatomic) BOOL show;
@property (nonatomic) BOOL root;
@property (nonatomic, copy) Block1 block1;
@property (nonatomic, copy) Block2 block2;
@property (nonatomic, strong) UIView *drawerView;
@property (nonatomic) BOOL drawerViewReset;
@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic) NSTimeInterval timeInterval;
//@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation FLFloatingView

#pragma mark - Life Cycle

// 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景色
        self.backgroundColor = [self colorWithHex:@"#f5dfb5"];
        
        // 设置为圆形
        self.layer.cornerRadius = CGRectGetMaxX(frame) / 2;
        
        // 添加点击手势
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
        // 抽屉视图
        self.drawerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.drawerView.backgroundColor = [self colorWithHex:@"#f5deb3"];
        self.drawerView.layer.cornerRadius = (CGRectGetMaxX(frame) - 10) / 2;
        [self addSubview:self.drawerView];
        
        // 判断展开方向是向左或向右
        if (frame.origin.x > self.superview.center.x) self.left = 0;
        else self.left = 1;
        
        // 设置收起的延时间隔
        [self foldAfterDelay:3.f];
        
        // 设置点击按钮后自动收起
        self.autoFoldAfterButtonClick = YES;
        
        // 设置开始移动需长按的时间间隔
        self.startMovingAfterTimeInterval = 0.8;
    }
    return self;
}

// 移除视图
- (void)removeFromSuperview
{
    [self closeTimer];
    [super removeFromSuperview];
}

#pragma mark - Events Management

// 触摸事件开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self closeTimer];
    
    CGPoint point = [[touches anyObject] locationInView:self];
    self.startLocation = point;
    [self.superview bringSubviewToFront:self];
    
    // 点击开始时的时间戳
    self.timestamp = [touches anyObject].timestamp;
}

// 触摸事件移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 如果当前时间戳与点击开始时的时间戳大于一秒，则判断是移动时间，否则是点击事件
    if ([touches anyObject].timestamp - self.timestamp > self.startMovingAfterTimeInterval) {
        if (self.show) {
            self.show = !self.show;
            self.drawerView.frame = CGRectMake(0, 0, 0, 0);
            for (UIView *view in self.subviews) {
                if ([view isKindOfClass:[UIButton class]]) {
                    [view removeFromSuperview];
                }
            }
        }
        
        CGPoint point = [[touches anyObject] locationInView:self];
        CGFloat x = point.x - self.startLocation.x;
        CGFloat y = point.y - self.startLocation.y;
        CGPoint center = CGPointMake(self.center.x + x, self.center.y + y);
        
        CGFloat centerX = CGRectGetMidX(self.bounds);
        center.x = MAX(centerX, center.x);
        center.x = MIN(self.superview.bounds.size.width - centerX, center.x);
        
        CGFloat centerY = CGRectGetMidY(self.bounds);
        center.y = MAX(centerY, center.y);
        center.y = MIN(self.superview.bounds.size.height - centerY, center.y);
        
        self.center = center;
    }
}

// 触摸事件结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self offset];
}

// 触摸事件取消
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self offset];
}

// 触摸事件穿透
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.subviews.count > 1) {
        self.root = NO;
        for (int i = 0; i < self.buttons.count; i++) {
            // 因为按钮位置在根视图外，按钮事件无法响应，需将按钮事件转移到根视图上，再判断是点击哪个按钮
            CGPoint newPoint = [self convertPoint:point toView:self.subviews[i + 1]];
            if ([self.subviews[i + 1] pointInside:newPoint withEvent:event]) {
                return self.subviews[i + 1];
            }
        }
    }
    self.root = YES;
    return [super hitTest:point withEvent:event];
}

// 手势点击事件
- (void)tapGestureRecognizer:(UIGestureRecognizer *)recognizer
{
    // 重设抽屉视图
    if (!self.drawerViewReset && [self.delegate respondsToSelector:@selector(floatingView:resetDrawerView:)]) {
        [self.delegate floatingView:self resetDrawerView:self.drawerView];
        self.drawerViewReset = YES;
    }
    
    // 计算位移
    [self offset];
    
    // 判断是否按钮点击
    if (self.root) {
        // 判断展开还是收起
        if (!self.show) {
            // 向右展开
            if (self.left) [self unfoldWithX1:CGRectGetMaxX(self.bounds) andX2:CGRectGetMaxX(self.bounds) andWidth1:0 andWidth2:50*self.buttons.count];
            // 向左展开
            else [self unfoldWithX1:0 andX2:-(CGFloat)50*self.buttons.count andWidth1:0 andWidth2:50 * self.buttons.count];
        } else {
            // 向左收起
            if (self.left) [self foldWithX:CGRectGetMaxX(self.bounds)];
            // 向右收起
            else [self foldWithX:0];
        }
        self.show = !self.show;
    }
}

// 按钮点击事件
- (void)buttonClick:(UIButton *)button
{
    if (self.autoFoldAfterButtonClick && self.show) {
        if (self.left) [self foldWithX:CGRectGetMaxX(self.bounds)];
        else [self foldWithX:0];
        self.show = !self.show;
    }
    
    // 回调点击事件
    if (self.block1) {
        self.block1(button.tag);
    } else if ([self.delegate respondsToSelector:@selector(floatingView:buttonClickEventWithTag:)]) {
        [self.delegate floatingView:self buttonClickEventWithTag:button.tag];
    }
}

// 收起到边缘 (配合 NSTimer)
//- (void)foldToEdge:(NSTimer *)timer
//{
//    if (self.autoFoldToEdge) {
//        if (self.show) {
//            if (self.left) [self foldWithX:CGRectGetMaxX(self.bounds)];
//            else [self foldWithX:0];
//            self.show = !self.show;
//        }
//        if (self.left) self.center = CGPointMake(0, self.center.y);
//        else self.center = CGPointMake(self.superview.bounds.size.width, self.center.y);
//    } else if (!self.show) {
//        if (self.left) self.center = CGPointMake(0, self.center.y);
//        else self.center = CGPointMake(self.superview.bounds.size.width, self.center.y);
//    }
//}

// 收起到边缘 (配合 GCD)
- (void)foldToEdge
{
    if (self.autoFoldToEdge) {
        if (self.show) {
            if (self.left) [self foldWithX:CGRectGetMaxX(self.bounds)];
            else [self foldWithX:0];
            self.show = !self.show;
        }
        if (self.left) self.center = CGPointMake(0, self.center.y);
        else self.center = CGPointMake(self.superview.bounds.size.width, self.center.y);
    } else if (!self.show) {
        if (self.left) self.center = CGPointMake(0, self.center.y);
        else self.center = CGPointMake(self.superview.bounds.size.width, self.center.y);
    }
}

#pragma mark - Private Methods

// 打开计时器
- (void)startTimer
{
    // 先关闭上一个计时器
    [self closeTimer];
    
    // 打开 NSTimer 计时器
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(foldToEdge:) userInfo:nil repeats:NO];
    
    // 打开 GCD 计时器
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.timeInterval * NSEC_PER_SEC)), 0, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        dispatch_source_cancel(self.timer);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self foldToEdge];
        });
    });
    dispatch_resume(self.timer);
}

// 关闭计时器
- (void)closeTimer
{
    // 关闭 NSTimer 计时器
//    [self.timer invalidate];
//    self.timer = nil;
    
    // 关闭 GCD 计时器
    if (self.timer) dispatch_source_cancel(self.timer);
    self.timer = nil;
}

// 计算位移
- (void)offset
{
    CGPoint point = self.center;
    if (point.x > self.superview.bounds.size.width / 2) {
        self.left = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.center = CGPointMake(self.superview.bounds.size.width - self.bounds.size.width / 2, self.center.y);
        } completion:^(BOOL finished) {
            [self startTimer];
        }];
    } else {
        self.left = 1;
        [UIView animateWithDuration:0.2 animations:^{
            self.center = CGPointMake(self.bounds.size.width / 2, self.center.y);
        } completion:^(BOOL finished) {
            [self startTimer];
        }];
    }
}

// 展开
- (void)unfoldWithX1:(CGFloat)x1 andX2:(CGFloat)x2 andWidth1:(CGFloat)width1 andWidth2:(CGFloat)width2
{
    self.drawerView.frame = CGRectMake(x1, CGRectGetMidY(self.bounds) - (CGRectGetMaxY(self.bounds) - 10) / 2, width1, CGRectGetMaxY(self.bounds) - 10);
    [UIView animateWithDuration:0.2 animations:^{
        self.drawerView.frame = CGRectMake(x2, CGRectGetMidY(self.bounds) - (CGRectGetMaxY(self.bounds) - 10) / 2, width2, CGRectGetMaxY(self.bounds) - 10);
    } completion:^(BOOL finished) {
        for (int i = 0; i < self.buttons.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            if (self.tags) button.tag = [self.tags[i] integerValue];
            else button.tag = 10000001 + i;
            button.frame = CGRectMake(CGRectGetWidth(self.drawerView.bounds) / self.buttons.count * i + x2 + 2, CGRectGetMinY(self.drawerView.frame), CGRectGetWidth(self.drawerView.bounds) / self.buttons.count - 3, CGRectGetHeight(self.drawerView.bounds));
            [button setTitleColor:[self colorWithHex:@"#1296db"] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:10];
            [button setTitle:self.buttons[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:button];
            
            if (self.block2) {
                self.block2(button);
            } else if ([self.delegate respondsToSelector:@selector(floatingView:resetButton:)]) {
                [self.delegate floatingView:self resetButton:button];
            }
        }
    }];
}

// 收起
- (void)foldWithX:(CGFloat)x
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.drawerView.frame = CGRectMake(x, CGRectGetMidY(self.bounds) - (CGRectGetMaxY(self.bounds) - 10) / 2, 0, CGRectGetMaxY(self.bounds) - 10);
    }];
}

// 16进制颜色
- (UIColor *)colorWithHex:(NSString *)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 6至8位字符串
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark - Public Methods

// 设置收起的延时间隔
- (void)foldAfterDelay:(NSTimeInterval)timeInterval
{
    self.timeInterval = timeInterval;
    [self closeTimer];
    [self startTimer];
}

// 重设抽屉视图
- (void)resetDrawerView:(void (^)(UIView * _Nonnull))block
{
    block(self.drawerView);
}

// 重置按钮
- (void)resetButton:(void (^)(UIButton * _Nonnull))block
{
    self.block2 = block;
}

// 按钮点击事件
- (void)buttonClickEventWithTag:(void (^)(NSInteger))block
{
    self.block1 = block;
}

@end
