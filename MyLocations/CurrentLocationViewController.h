//
//  FirstViewController.h
//  MyLocations
//
//  Created by 戴王炯 on 15/8/11.
//  Copyright © 2015年 戴王炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocationViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, weak)IBOutlet UILabel *messageLabel;
@property (nonatomic, weak)IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak)IBOutlet UILabel *longtitudeLabel;
@property (nonatomic, weak)IBOutlet UILabel *adderssLabel;
@property (nonatomic, weak)IBOutlet UIButton *tagButton;
@property (nonatomic, weak)IBOutlet UIButton *getButton;

-(IBAction)getLocation:(id)sender;

@end

