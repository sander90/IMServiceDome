//
//  SDChatTableViewCell.h
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDChatModel;

@interface SDChatTableViewCell : UITableViewCell

@property (nonatomic,strong,readonly) SDChatModel * chatModel;

/**
 * 建立聊天内容的cell
 */
- (void)buildingChatContent:(SDChatModel *)cm;



@end
