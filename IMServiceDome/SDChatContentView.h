//
//  SDChatContentView.h
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KWidthOfPortraitAndSpacing 45.0f

#define kLeftBackGroupImageViewName @"weChatBubble_Receiving_Solid"
#define kRightBackGroupImageViewName @"weChatBubble_Sending_Solid"

#define KtopOfEdgeInsets_left 10

#define KleftOfEdgeInsets_left 25

#define KbottomOfEdgeInsets_left 20

#define KrightOfEdgeInsets_left 10

#define KtopOfEdgeInsets_right 10

#define KleftOfEdgeInsets_right 10

#define KbottomOfEdgeInsets_right 10

#define KrightOfEdgeInsets_right 25
@class SDChatModel;

@interface SDChatContentView : UIView

@property (nonatomic, strong,readonly) SDChatModel * chatModel;

@property (nonatomic, strong) UIImageView * thebackImageView;

- (id)initWithChatModel:(SDChatModel *)cm;

- (void)setupChatModel:(SDChatModel * )cm;

- (void)buildingLeftChatContentView;

- (void)buildingRightChatContentView;
@end
