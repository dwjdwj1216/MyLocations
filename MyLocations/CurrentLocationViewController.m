//
//  FirstViewController.m
//  MyLocations
//
//  Created by 戴王炯 on 15/8/11.
//  Copyright © 2015年 戴王炯. All rights reserved.
//

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController{
    CLLocationManager *_locationManager;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super initWithCoder:aDecoder])){
        _locationManager = [[CLLocationManager alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getLocation:(id)sender{
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:( CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization) ]){
                [_locationManager requestAlwaysAuthorization];
            }
            break;
            
        default:
            break;
    }
}

#pragma mark -CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败：%@",error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"已更新坐标，当前位置：%@",newLocation);
}
@end
