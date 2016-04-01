//
//  SDChatContentView.h
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDChatModel;

@interface SDChatContentView : UIView

@property(nonatomic, strong,readonly) SDChatModel * chatModel;


- (id)initWithChatModel:(SDChatModel *)cm;

- (void)buildingLeftChatContentView;

- (void)buildingRightChatContentView;
@end
