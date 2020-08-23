//
//  SSCourseModel.h
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import <Foundation/Foundation.h>
#import "SSTimeSlotModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSCourseModel : NSObject

@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* subSelected;
@property (nonatomic, strong) NSArray* subAvailable;
@property (nonatomic, strong) NSDictionary* subTimeSlotInfo;

@property (nonatomic, strong) SSTimeSlotModel* selTimeSlot;

@end

NS_ASSUME_NONNULL_END
