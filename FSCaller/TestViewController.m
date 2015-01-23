//
//  TestViewController.m
//  FSCaller
//
//  Created by Jason Hoffman on 1/20/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "TestViewController.h"
#import "FlightStatsCaller.h"

@interface TestViewController () <FlightStatsCallerDelegate>

@property (nonatomic, strong) FlightStatsCaller *fsc;
@property (nonatomic, strong) UITextField *productField;
@property (nonatomic, strong) UITextField *airportField;

@end

@implementation TestViewController

- (void)loadView
{

    CGRect frame = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor grayColor];
    self.view = view;
    
    CGRect buttonFrame = CGRectMake(50, 50, 200, 100);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:buttonFrame];
    [button setTitle:@"Go" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(useFSCaller) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor greenColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    [view addSubview:button];
    
    CGRect textFrame1 = CGRectMake(50, 200, 200, 40);
    self.productField = [[UITextField alloc] initWithFrame:textFrame1];
    self.productField.placeholder = @"Weather product";
    self.productField.returnKeyType = UIReturnKeyDone;
    self.productField.backgroundColor = [UIColor whiteColor];
    [view addSubview:self.productField];
    
    CGRect textFrame2 = CGRectMake(50, 300, 200, 40);
    self.airportField = [[UITextField alloc] initWithFrame:textFrame2];
    self.airportField.placeholder = @"Airport code";
    self.airportField.returnKeyType = UIReturnKeyDone;
    self.airportField.backgroundColor = [UIColor whiteColor];
    [view addSubview:self.airportField];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fsc = [[FlightStatsCaller alloc] init];
    self.fsc.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)useFSCaller
{
    NSString *product = self.productField.text;
    NSString *airport = self.airportField.text;
    
    [self.fsc retreiveProduct:product forAirport:airport completionHandler:^(NSDictionary *resp) {
        NSLog(@"Response: %@", resp);
    }];
}

// FSCallerDelegate

- (void)didReceiveResponse
{
    NSLog(@"It worked");
}

@end
