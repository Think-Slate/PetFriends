//
//  ViewController.h
//  PetFriends
//
//  Created by Tim Wurman on 2/7/15.
//  Copyright (c) 2015 Think~Slate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>
#import "BLE.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController<BLEDelegate>{
    
}

@property (strong, nonatomic) BLE *ble;
@property (strong, nonatomic) IBOutlet UIButton *addPet;
@property (strong, nonatomic) IBOutlet UITableView *petsTable;

@end

