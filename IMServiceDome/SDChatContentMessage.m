//
//  SDChatContentMessage.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatContentMessage.h"
#import "SDChatModel.h"
#import "SDChatTableViewCell.h"

@implementation SDChatContentMessage

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _chatMessageList = [[NSMutableArray alloc] init];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
- (void)reloadChatContentTable
{
    
}
- (void)insertOneChatContentMessage:(SDChatModel*)cm
{
    [self.chatMessageList addObject:cm];
    NSIndexPath * path = [NSIndexPath indexPathForRow:self.chatMessageList.count - 1 inSection:0];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self beginUpdates];
        if (cm.type == Chat_Friend) {
            [self insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
        }else{
            [self insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationRight];
        }
        [self endUpdates];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chatMessageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SDChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSInteger row = indexPath.row;
    SDChatModel * cm = self.chatMessageList[row];
    [cell buildingChatContent:cm];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    SDChatModel * cm = self.chatMessageList[row];
    return cm.heightOfCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
