//
//  SSGlobalDefinitions.h
//  shipshape
//
//  Created by Li Ruijie on 6/7/2020.
//

#ifndef SSGlobalDefinitions_h
#define SSGlobalDefinitions_h

/// Fonts
#define REGULAR_FONT(_size)     [UIFont fontWithName:@"Aleo-Regular" size:_size]
#define BOLD_FONT(_size)        [UIFont fontWithName:@"Aleo-Bold" size:_size]
#define LIGHT_FONT(_size)       [UIFont fontWithName:@"Aleo-Light" size:_size]

/// Cal Spec
#define DAY_WIDTH               [SSCalendarSpecManager sharedObject].singleDayWidth
#define MIN_HEIGHT              [SSCalendarSpecManager sharedObject].minuteHeight
#define HR_HEIGHT               [SSCalendarSpecManager sharedObject].minuteHeight * 60
#define SET_DAY_WIDTH(width)    [SSCalendarSpecManager registerDayWidth:width]
#define SET_MIN_HEIGHT(height)  [SSCalendarSpecManager registerMinHeight:height]

#endif /* SSGlobalDefinitions_h */
