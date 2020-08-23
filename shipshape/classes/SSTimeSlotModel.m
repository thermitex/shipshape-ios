//
//  SSTimeSlotModel.m
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import "SSTimeSlotModel.h"

@implementation SSTimeSlotModel

- (void)setStartTime:(NSString *)startTime {
    _startTime = startTime;
    NSArray* components = [startTime componentsSeparatedByString:@":"];
    _startTimeHour = [components[0] integerValue];
    _startTimeMinute = [components[1] integerValue];
}

- (void)setEndTime:(NSString *)endTime {
    _endTime = endTime;
    NSArray* components = [endTime componentsSeparatedByString:@":"];
    _endTimeHour = [components[0] integerValue];
    _endTimeMinute = [components[1] integerValue];
}

@end
