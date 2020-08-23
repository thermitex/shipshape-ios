//
//  SSLocalStorageManager.m
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import "SSLocalStorageManager.h"
#import "SSCourseModel.h"

@interface SSLocalStorageManager ()

@property (nonatomic, strong) NSMutableArray<SSCourseModel *> *courseCache;

@end

@implementation SSLocalStorageManager

+ (SSLocalStorageManager *)sharedObject {
    static SSLocalStorageManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSMutableArray<SSCourseModel *> *)courseCache {
    if (!_courseCache) {
        _courseCache = [NSMutableArray new];
    }
    return _courseCache;
}

+ (NSArray *)courseStorage {
    return [self sharedObject].courseCache;
}

+ (void)addCourseToStorage:(SSCourseModel *)course {
    [[self sharedObject].courseCache addObject:course];
}

- (void)p_persistCourseCache {
    
}

@end
