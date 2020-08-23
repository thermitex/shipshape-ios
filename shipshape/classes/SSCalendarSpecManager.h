//
//  SSCalendarSpecManager.h
//  shipshape
//
//  Created by Li Ruijie on 6/7/2020.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSCalendarSpecManager : NSObject

@property (nonatomic) CGFloat singleDayWidth;
@property (nonatomic) CGFloat minuteHeight;

+ (SSCalendarSpecManager *)sharedObject;
+ (void)registerDayWidth: (CGFloat)dayWidth;
+ (void)registerMinHeight: (CGFloat)minHeight;

@end

NS_ASSUME_NONNULL_END
