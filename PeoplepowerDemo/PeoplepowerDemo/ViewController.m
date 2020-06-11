//
//  ViewController.m
//  PeoplepowerDemo
//
//  Created by Destry Teeter on 6/5/20.
//  Copyright © 2020 peoplepowerco. All rights reserved.
//

#import "ViewController.h"

@import Peoplepower;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *appName = [PPBaseModel appName:NO];
    
    PPUser *user = [PPUser initWithDictionary:@{}];
    user.firstName = @"this";
    NSLog(@"user.firstName: %@", user.firstName);
    
    PPLocation *location = [PPLocation initWithDictionary:@{}];
    location.appName = @"my app";
    NSLog(@"location.appName: %@", location.appName);
}


@end