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

#import "SDRoomChatViewController.h"

#import <IMService/IMService.h>

@interface ViewController ()<XmppConnectionDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSArray * list;
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
    
    list = @[@"sander1",@"请求添加好友",@"聊天室",@"list"];
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
    return list.count;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"chatcell"];
    NSString* string = list[indexPath.row];
    cell.textLabel.text = string;
    
    return cell;
}
#pragma mark - UITableViewDelegate;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //chatconrtentstory
    NSInteger row = indexPath.row;
    if (row == 0) {
        SDChatViewController *  cc = [self.storyboard instantiateViewControllerWithIdentifier:@"chatconrtentstory"];
        [self.navigationController pushViewController:cc animated:true];
    }else if (row == 1){
        IMService * ims = [IMService initService];
        [ims queryRosterandResult:^(id data) {
            NSLog(@"%@",data);
        }];
//        [ims addOneFriendWithFriendName:@"truman"];
    }else if (row == 2){
        SDRoomChatViewController * roomChat = [self.storyboard instantiateViewControllerWithIdentifier:@"roomchatstory"];
        [self.navigationController pushViewController:roomChat animated:true];
    }else if (row == 3){
        IMService * im = [IMService initService];
        [im fetchRoomChatListWithFinishReslut:^(id data) {
            NSArray * items = data;
            NSLog(@"%@",items);
        }];
        
    }
    
}

@end
