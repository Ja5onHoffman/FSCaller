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

- (void)retreiveProduct:(NSString *)product forAirport:(NSString *)airport completionHandler:(void(^)( NSDictionary *resp))completionHandler;

@end

@interface FlightStatsCaller : AFHTTPSessionManager

@property (nonatomic, weak) id <FlightStatsCallerDelegate> delegate;

- (void)retreiveProduct:(NSString *)product forAirport:(NSString *)airport completionHandler:(void(^)( NSDictionary *resp))completionHandler;

@end
