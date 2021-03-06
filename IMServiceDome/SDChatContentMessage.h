//
//  SDChatContentMessage.h
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KheightToTopSpacingView 20.0
@class SDChatModel;
@interface SDChatContentMessage : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign,readonly) CGRect defineFrame;

@property (nonatomic, strong,readonly) NSMutableArray * chatMessageList;

/**
 * 添加一个聊天内容
 */
- (void)insertOneChatContentMessage:(SDChatModel*)cm;


- (void)changeFrameWithKeyBoardShow:(CGFloat)hight;

- (void)changeFrameWithKeyBoardHide;
@end
