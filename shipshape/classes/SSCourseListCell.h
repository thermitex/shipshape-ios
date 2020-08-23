//
//  SSCourseListCell.h
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import <UIKit/UIKit.h>
#import "SSCourseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSCourseListCell : UITableViewCell

- (void)configWithCourse:(SSCourseModel *)course;

@end

NS_ASSUME_NONNULL_END
