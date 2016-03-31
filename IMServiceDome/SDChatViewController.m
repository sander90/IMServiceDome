//
//  SDChatViewController.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatViewController.h"
#import "SDChatContentMessage.h"
#import <IMService/Chat.h>
#import "SDChatModel.h"

@interface SDChatViewController ()<ChatDelegate>{
    SDChatContentMessage * chatMessage;
    Chat * chat;
}

@end

@implementation SDChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildingChatService];
    [self setChatContentView];
    // Do any additional setup after loading the view.
}
#pragma mark - 建立聊天的服务
- (void)buildingChatService
{
    self.friendname = @"sander1";
    chat = [[Chat alloc] initWithFriendName:@"sander1"];
    chat.delegate = self;
}
#pragma mark - 建立聊天的记录的界面
- (void)setChatContentView
{
    CGRect selfRect = [[UIScreen mainScreen] bounds];
    chatMessage = [[SDChatContentMessage alloc] initWithFrame:selfRect style:UITableViewStylePlain];
    [self.view addSubview:chatMessage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)XMPPdidReceiveMessage:(NSString * )message withFriendName:(NSString *)user
{
    if ([user isEqualToString:_friendname]) {
        SDChatModel * cm = [[SDChatModel alloc] initWithContent:message andChatModel:Chat_Friend];
        [chatMessage insertOneChatContentMessage:cm];
    }else{
        SDChatModel * cm = [[SDChatModel alloc] initWithContent:message andChatModel:Chat_Me];
        [chatMessage insertOneChatContentMessage:cm];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
