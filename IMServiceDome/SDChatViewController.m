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
#import "SDChatInputView.h"
#import <IMService/ChatDBManager.h>
#import <IMService/ChatContentModel.h>


@interface SDChatViewController ()<ChatDelegate>{
    SDChatContentMessage * chatMessage;
    Chat * chat;
    SDChatInputView * inputChatView;
}

@end

@implementation SDChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1
    [self buildingChatService];
    //2
    [self setChatContentView];
    //3
    [self setInputChatView];
    
    [self registerForKeyboardNotifications];
    
    [self initChatContentData];
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
    CGRect chatMessageFrame = CGRectMake(0, 0, selfRect.size.width, selfRect.size.height - KheightOfChatInput);
    chatMessage = [[SDChatContentMessage alloc] initWithFrame:chatMessageFrame style:UITableViewStylePlain];
    [self.view addSubview:chatMessage];
    chatMessage.backgroundColor = [UIColor redColor];
}
#pragma mark - 建立聊天的输入view
- (void)setInputChatView
{
    inputChatView = [[SDChatInputView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(chatMessage.frame), chatMessage.frame.size.width, KheightOfChatInput)];
    
    [self.view addSubview:inputChatView];
    [inputChatView setChat:chat];
    inputChatView.backgroundColor = [UIColor blueColor];
}

- (void)initChatContentData
{
    ChatDBManager * cm = [ChatDBManager defineDBManager];
    NSArray * list = [cm fetchChatContentWithChatID:self.friendname];
    __weak typeof(self) weak_self = self;
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ChatContentModel * one = obj;
        if ([one.friendname isEqualToString:self.friendname]) {
            SDChatModel * cm = [[SDChatModel alloc] initWithContent:one.chatContent andChatModel:Chat_Friend];
            [chatMessage.chatMessageList addObject:cm];
        }else{
            SDChatModel * cm = [[SDChatModel alloc] initWithContent:one.chatContent andChatModel:Chat_Me];
            [chatMessage.chatMessageList addObject:cm];
        }
    }];
    [chatMessage reloadData];
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

- (void)XMPPdidSendMessage:(NSString *)message
{
    SDChatModel * cm = [[SDChatModel alloc] initWithContent:message andChatModel:Chat_Me];
    [chatMessage insertOneChatContentMessage:cm];

}
#pragma mark - 注册键盘通知
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)cancelForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - 显示虚拟键盘
- (void) keyboardWasShown:(NSNotification *) notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    NSLog(@"keyBoard:%f", keyboardSize.height);  //216
    [chatMessage changeFrameWithKeyBoardShow:keyboardSize.height];
    inputChatView.frame = CGRectMake(0, CGRectGetMaxY(chatMessage.frame), inputChatView.frame.size.width, inputChatView.frame.size.height);
    
}
#pragma mark - 隐藏虚拟键盘
- (void) keyboardWasHidden:(NSNotification *) notif
{
    NSDictionary *info = [notif userInfo];
    
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    NSLog(@"keyboardWasHidden keyBoard:%f", keyboardSize.height);
    [chatMessage changeFrameWithKeyBoardHide];
    inputChatView.frame = CGRectMake(0, CGRectGetMaxY(chatMessage.frame), inputChatView.frame.size.width, inputChatView.frame.size.height);
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
