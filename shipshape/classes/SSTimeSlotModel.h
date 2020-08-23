//
//  SSTimeSlotModel.h
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSTimeSlotModel : NSObject

@property (nonatomic, strong) NSString* venue;
@property (nonatomic, strong) NSString* startTime;
@property (nonatomic, strong) NSString* endTime;
@property (nonatomic) NSInteger day;

@property (nonatomic) NSInteger startTimeHour;
@property (nonatomic) NSInteger startTimeMinute;
@property (nonatomic) NSInteger endTimeHour;
@property (nonatomic) NSInteger endTimeMinute;

@end

NS_ASSUME_NONNULL_END
