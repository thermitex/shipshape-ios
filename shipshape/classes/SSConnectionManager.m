//
//  SSConnectionManager.m
//  shipshape
//
//  Created by Li Ruijie on 23/8/2020.
//

#import "SSConnectionManager.h"

@implementation SSConnectionManager

+ (void)searchCourseWithInput:(NSString *)input andSem:(NSString *)sem completion:(void (^)(NSDictionary *json))completionHandler {
    __block NSDictionary *json;
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://shipshapeplanner.com/mobilebk/searchcourse.jsp?input=%@&sem=%@", input, sem]]
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
                                        json = [NSJSONSerialization JSONObjectWithData:data
                                                                               options:0
                                                                                 error:nil];
                                        completionHandler(json);
    }] resume];
}

+ (void)getSubWithCourseCode:(NSString *)code andSem:(NSString *)sem completion:(void (^)(NSDictionary *json))completionHandler {
    __block NSDictionary *json;
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://shipshapeplanner.com/mobilebk/getsub.jsp?cc=%@&sem=%@", code, sem]]
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
                                        json = [NSJSONSerialization JSONObjectWithData:data
                                                                               options:0
                                                                                 error:nil];
                                        completionHandler(json);
    }] resume];
}

@end
