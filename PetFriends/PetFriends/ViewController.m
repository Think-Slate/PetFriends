//
//  ViewController.m
//  PetFriends
//
//  Created by Tim Wurman on 2/7/15.
//  Copyright (c) 2015 Think~Slate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize ble;
@synthesize petsTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - BLEDelegate
-(void)bleDidConnect{
    
}

-(void)bleDidDisconnect{
    
}

-(void)bleDidReceiveData:(unsigned char *)data length:(int)length{
    
    if(data[0] == 0x00){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Computer Under Attack!" message:@"Beware! Your computer might be getting stolen!" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }
}

-(void)bleDidUpdateRSSI:(NSNumber *)rssi{
    //do nothing
}

#pragma mark - BLE Actions
-(void)scanForPeripherals{
    [self disconnectFromPeripheral];
    
    if(ble.peripherals){
        ble.peripherals = nil;
    }
    
    [ble findBLEPeripherals:2];
    [NSTimer scheduledTimerWithTimeInterval:(float)3.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
    
}

-(void)disconnectFromPeripheral{
    //this seems like its for disconnecting...
    if(ble.activePeripheral){
        if (ble.activePeripheral.isConnected) {
            [[ble CM] cancelPeripheralConnection:[ble activePeripheral]];
            
        }
    }
}

-(void)connectionTimer:(NSTimer*)timer{
    
    
    if(ble.peripherals.count > 0){
        
        [ble connectPeripheral:[ble.peripherals objectAtIndex:0]];
        [NSTimer scheduledTimerWithTimeInterval:(float)300.0 target:self selector:@selector(disconnectTimer:) userInfo:nil repeats:NO];
        
    } else {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Device not in range" message:@"Could not connect to device. Must be within 100ft of your location" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }
    
}

-(void)disconnectTimer:(NSTimer*)timer{
    if (ble.activePeripheral.isConnected) {
        [self disconnectFromPeripheral];
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Disconnected From Device" message:@"Press Retry to Reconnect" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
        
    } else {
        //not working properly
        [timer invalidate];
    }
    
}

@end
