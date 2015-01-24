//
//  FlightStatsCaller.h
//  FSCaller
//
//  Created by Jason Hoffman on 1/20/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class FlightStatsCaller;

@protocol FlightStatsCallerDelegate <NSObject>

- (void)retrieveProduct:(NSString *)product forAirport:(NSString *)airport completionHandler:(void(^)( NSDictionary *resp))completionHandler;

@end

@interface FlightStatsCaller : AFHTTPSessionManager <NSURLSessionDelegate>

@property (nonatomic, weak) id <FlightStatsCallerDelegate> delegate;

+ (FlightStatsCaller *)sharedFlightStatsCaller;
- (instancetype)initWithBaseURL:(NSURL *)url;
- (void)retrieveProduct:(NSString *)product forAirport:(NSString *)airport completionHandler:(void(^)( NSDictionary *resp))completionHandler;

@end
