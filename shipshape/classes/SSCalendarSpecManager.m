//
//  SSCalendarSpecManager.m
//  shipshape
//
//  Created by Li Ruijie on 6/7/2020.
//

#import "SSCalendarSpecManager.h"

@implementation SSCalendarSpecManager

+ (SSCalendarSpecManager *)sharedObject {
    static SSCalendarSpecManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _singleDayWidth = 0;
        _minuteHeight = 0;
    }
    return self;
}

+ (void)registerDayWidth: (CGFloat)dayWidth {
    [self sharedObject].singleDayWidth = dayWidth;
}

+ (void)registerMinHeight: (CGFloat)minHeight {
    [self sharedObject].minuteHeight = minHeight;
}

@end
