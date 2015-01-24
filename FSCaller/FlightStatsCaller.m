//
//  FlightStatsCaller.m
//  FSCaller
//
//  Created by Jason Hoffman on 1/20/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "FlightStatsCaller.h"

static NSString * const FlightStatsBaseURL = @"https://api.flightstats.com/flex";
@interface FlightStatsCaller()

@property (nonatomic, strong) NSString *FlightStatsAppID;
@property (nonatomic, strong) NSString *FlightStatsAPIKey;

@end

@implementation FlightStatsCaller

+ (FlightStatsCaller *)sharedFlightStatsCaller
{
    static FlightStatsCaller *_sharedFlightStatsCaller = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFlightStatsCaller = [[self alloc] initWithBaseURL:[NSURL URLWithString:FlightStatsBaseURL]];
    });
    
    return _sharedFlightStatsCaller;
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

// Products: all, metar, taf, zf (zone forecast)
- (void)retrieveProduct:(NSString *)product forAirport:(NSString *)airport completionHandler:(void(^)(NSDictionary *resp))completionHandler
{
    // This version gets API key and appID from untracked .plist file.
    // Remove this code to use your own appID and API key.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"keys" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.FlightStatsAPIKey = [dict objectForKey:@"FLIGHTSTATS_API_KEY"];
    self.FlightStatsAppID  = [dict objectForKey:@"FLIGHTSTATS_APP_ID"];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@", FlightStatsBaseURL, @"weather/rest/v1/json", product, airport];
    
    [self.requestSerializer setValue:self.FlightStatsAPIKey forHTTPHeaderField:@"appKey"];
    [self.requestSerializer setValue:self.FlightStatsAppID forHTTPHeaderField:@"appId"];
    
    [self GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        completionHandler(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"There was an error");
    }];
}

@end
