//
//  SSCourseListCell.m
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import "SSCourseListCell.h"
#import "SSGlobalDefinitions.h"

@implementation SSCourseListCell

- (void)configWithCourse:(SSCourseModel *)course {
    self.layer.borderColor = [UIColor colorNamed:@"contentPrimaryColor"].CGColor;
    self.layer.borderWidth = 1;
    
    UILabel *courseCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width, 18)];
    courseCodeLabel.font = BOLD_FONT(15);
    courseCodeLabel.textColor = [UIColor colorNamed:@"contentPrimaryColor"];
    courseCodeLabel.text = course.code;
    [self addSubview:courseCodeLabel];
    
    UILabel *courseTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 26, self.bounds.size.width, 18)];
    courseTitleLabel.font = BOLD_FONT(15);
    courseTitleLabel.textColor = [UIColor colorNamed:@"contentPrimaryColor"];
    courseTitleLabel.numberOfLines = 1;
    courseTitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    courseTitleLabel.text = course.title;
    [self addSubview:courseTitleLabel];
    
    UILabel *selectedSubLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 44, self.bounds.size.width, 18)];
    selectedSubLabel.font = LIGHT_FONT(15);
    selectedSubLabel.textColor = [UIColor colorNamed:@"contentPrimaryColor"];
    selectedSubLabel.text = [NSString stringWithFormat:@"Sub: %@", course.subSelected];
    [self addSubview:selectedSubLabel];
}

@end
