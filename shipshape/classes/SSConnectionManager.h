//
//  SSConnectionManager.h
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSConnectionManager : NSObject

+ (void)searchCourseWithInput:(NSString *)input andSem:(NSString *)sem completion:(void (^)(NSDictionary *json))completionHandler;
+ (void)getSubWithCourseCode:(NSString *)code andSem:(NSString *)sem completion:(void (^)(NSDictionary *json))completionHandler;

@end

NS_ASSUME_NONNULL_END
