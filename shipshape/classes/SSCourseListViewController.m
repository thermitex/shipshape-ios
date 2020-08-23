//
//  SSCourseListViewController.m
//  shipshape
//
//  Created by Li Ruijie on 8/7/2020.
//

#import "SSCourseListViewController.h"
#import "SSCourseModel.h"
#import "SSCourseListCell.h"
#import "SSLocalStorageManager.h"

static NSString *const courseListCellIdentifier = @"courseListCellIdentifier";
static const NSInteger kRowHeight = 70;
static const NSInteger kCellMargin = 10;

@interface SSCourseListViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *courseSearchBar;
@property (weak, nonatomic) IBOutlet UITableView *courseTableView;
@property (nonatomic, strong) NSArray<SSCourseModel *> *localCourses;

@end

@implementation SSCourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _courseSearchBar.delegate = self;
    _courseTableView.delegate = self;
    _courseTableView.dataSource = self;
    _courseTableView.alwaysBounceVertical = NO;
    [_courseTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_courseTableView registerClass:[SSCourseListCell class] forCellReuseIdentifier:courseListCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _localCourses = [SSLocalStorageManager courseStorage];
    [_courseTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_localCourses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSCourseModel *course = _localCourses[indexPath.row];
    SSCourseListCell *courseCell = [tableView dequeueReusableCellWithIdentifier:courseListCellIdentifier];
    [courseCell configWithCourse:course];
    return courseCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? kCellMargin : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
