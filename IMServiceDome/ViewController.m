//
//  ViewController.m
//  IMServiceDome
//
//  Created by shansander on 16/3/14.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "ViewController.h"

#import <IMService/AbstractXMPPConnection.h>

#import "SDChatViewController.h"

@interface ViewController ()<XmppConnectionDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
}
//chatcell
@property (nonatomic, weak)IBOutlet UITableView * theTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AbstractXMPPConnection* connect = [[AbstractXMPPConnection alloc] initWithName:@"sander" andPassword:@"123456" andServiceName:@"117.158.46.13"];
    [connect setDelegate:self];
    [connect connect];
    // Do any additional setup after loading the view, typically from a nib.
    // 建立界面
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - XmppConnectionDelegate
- (void)XMPPDidConnect
{
    NSLog(@"did Connect");
}
- (void)XMPPNotConnect
{
    NSLog(@"not Connect");
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"chatcell"];
    cell.textLabel.text = @"sander1";
    return cell;
}
#pragma mark - UITableViewDelegate;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //chatconrtentstory
    SDChatViewController *  cc = [self.storyboard instantiateViewControllerWithIdentifier:@"chatconrtentstory"];
    [self.navigationController pushViewController:cc animated:true];
}

@end
