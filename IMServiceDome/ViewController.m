//
//  ViewController.m
//  IMServiceDome
//
//  Created by shansander on 16/3/14.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "ViewController.h"

#import <IMService/AbstractXMPPConnection.h>

@interface ViewController ()<XmppConnectionDelegate>
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AbstractXMPPConnection* connect = [[AbstractXMPPConnection alloc] initWithName:@"sander" andPassword:@"123456" andServiceName:@"117.158.46.13"];
    [connect setDelegate:self];
    [connect connect];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)XMPPDidConnect
{
    NSLog(@"did Connect");
}
- (void)XMPPNotConnect
{
    NSLog(@"not Connect");
}

@end
