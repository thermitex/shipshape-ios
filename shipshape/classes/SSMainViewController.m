//
//  ViewController.m
//  shipshape
//
//  Created by Li Ruijie on 5/7/2020.
//

#import "SSMainViewController.h"
#import "SSGlobalDefinitions.h"
#import "SSCalendarSpecManager.h"
#import <SideMenu-Swift.h>

@interface SSMainViewController ()

@property (weak, nonatomic) IBOutlet UIView *calendarWrapperView;
@property (weak, nonatomic) IBOutlet UIView *calendarHeaderView;
@property (weak, nonatomic) IBOutlet UIView *calendarSideView;
@property (weak, nonatomic) IBOutlet UILabel *courseSelectHintLabel;
@property (weak, nonatomic) IBOutlet UIButton *courseListButton;

@end

@implementation SSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self setupSideMenu];
}

- (void)viewDidAppear:(BOOL)animated {
    [self setupInitialView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Set Up Views

static const int kHeaderLeftMargin = 25;
static const int kMainLeftRightMargin = 10;
static const int kExtraLineHeight = 13;
static const int kTimeDisplayLineHeight = 15;
static const int kSpaceForTimeLine = 2;

- (void)setupSideMenu {
    SideMenuNavigationController *leftMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenu"];
    [SideMenuManager defaultManager].leftMenuNavigationController = leftMenu;
    [[SideMenuManager defaultManager] addScreenEdgePanGesturesToPresentToView:self.view forMenu:PresentDirectionLeft];
}

- (void)setupInitialView {
    [self setupCalendarHeaderViewWithAllDays:NO];
    [self setupCourseSelectEntryWithNumber:0];
    [self setupCalendarSideViewFrom:8 until:20];
}

- (void)setupCalendarHeaderViewWithAllDays:(BOOL)allDays {
    NSArray *dayLabels = @[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"];
    SET_DAY_WIDTH(([UIScreen mainScreen].bounds.size.width - kHeaderLeftMargin -kMainLeftRightMargin) / (allDays ? 7 : 5));
    CGFloat individualHeight = _calendarHeaderView.bounds.size.height;
    for (int i = (allDays ? 0 : 1); i < (allDays ? 7 : 6); i++) {
        UIView *dayHeaderView = [[UIView alloc] initWithFrame:CGRectMake((i - (allDays ? 0 : 1)) * DAY_WIDTH, 0, DAY_WIDTH, individualHeight)];
        UILabel *dayDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DAY_WIDTH, individualHeight)];
        dayDisplayLabel.text = dayLabels[i];
        dayDisplayLabel.textAlignment = NSTextAlignmentCenter;
        dayDisplayLabel.font = REGULAR_FONT(10);
        dayDisplayLabel.textColor = [UIColor colorNamed:@"contentSecondaryColor"];
        [dayHeaderView addSubview:dayDisplayLabel];
        [_calendarHeaderView addSubview:dayHeaderView];
    }
}

- (void)setupCourseSelectEntryWithNumber: (int)number {
    _courseSelectHintLabel.text = [NSString stringWithFormat:@"%d Course Selected", number];
}

- (void)setupCalendarSideViewFrom:(int)startHour until:(int)endHour {
    int segments = endHour - startHour;
    SET_MIN_HEIGHT((_calendarSideView.frame.size.height - kExtraLineHeight) / (segments * 60));
    for (int i = 0; i <= segments; i++) {
        UILabel *hourDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMainLeftRightMargin, i * HR_HEIGHT + kSpaceForTimeLine, kTimeDisplayLineHeight, kHeaderLeftMargin - kMainLeftRightMargin)];
        hourDisplayLabel.text = [NSString stringWithFormat:@"%02d", startHour + i];
        hourDisplayLabel.font = LIGHT_FONT(10);
        hourDisplayLabel.textColor = [UIColor colorNamed:@"contentSecondaryColor"];
        [_calendarSideView addSubview:hourDisplayLabel];
        
        UIView *timeLine = [[UIView alloc] initWithFrame:CGRectMake(kMainLeftRightMargin, i * HR_HEIGHT, [UIScreen mainScreen].bounds.size.width - kMainLeftRightMargin * 2, 1)];
        timeLine.backgroundColor = [UIColor colorNamed:@"contentSecondaryColor"];
        timeLine.alpha = 0.15;
        [_calendarSideView addSubview:timeLine];
    }
}

#pragma mark - Explicit Actions

- (IBAction)courseListPressed:(id)sender {
    UIViewController* courseListVC = [self.storyboard instantiateViewControllerWithIdentifier:@"courseList"];
    [self presentViewController:courseListVC animated:YES completion:nil];
}

#pragma mark - Private Methods

@end
