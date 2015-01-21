//
//  TestViewController.m
//  FSCaller
//
//  Created by Jason Hoffman on 1/20/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

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
    button.backgroundColor = [UIColor greenColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    
    [view addSubview:button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// FSCaller

- (void)callFSCaller
{
    
}

@end
