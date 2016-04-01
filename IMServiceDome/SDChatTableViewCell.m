//
//  SDChatTableViewCell.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatTableViewCell.h"

#import "SDChatModel.h"

#import "UserPortraitView.h"

#import "SDChatContentView.h"

#import "SDChatTextContentView.h"

@interface SDChatTableViewCell ()
{
    
}
@property (nonatomic, strong)UserPortraitView * user_portraitView;

@property (nonatomic, strong)SDChatContentView * chatContentView;

@end

@implementation SDChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildingDefineChatContentView];
    }
    return self;
}
- (void)buildingDefineChatContentView
{
    _user_portraitView = [[UserPortraitView alloc] init];
    [self addSubview:_user_portraitView];

}
- (void)buildingChatContent:(SDChatModel *)cm
{
    _chatModel = cm;
    if (self.chatModel.type == Chat_Friend) {
        [self buildingLeftChatMessage];
    }else{
        [self buildingRightChatMessage];
    }
    if (self.chatContentView) {
        [self.chatContentView removeFromSuperview];
        self.chatContentView = nil;
    }
    
    self.chatContentView = [[SDChatTextContentView alloc] init];
    
    [self addSubview:self.chatContentView];
    
    [self.chatContentView setupChatModel:cm];
}

- (void)buildingLeftChatMessage
{
    CGPoint centerPoint = CGPointMake(self.contentView.bounds.origin.x + self.user_portraitView.frame.size.width/2.0f + 10, self.contentView.bounds.origin.y + self.contentView.frame.size.height/2.0f);
    self.user_portraitView.center = centerPoint;
}
- (void)buildingRightChatMessage
{
    CGPoint centerPoint = CGPointMake(self.contentView.bounds.origin.x + self.contentView.frame.size.width - self.user_portraitView.frame.size.width / 2.0f - 10, self.contentView.bounds.origin.y + self.contentView.frame.size.height/2.0f);
    self.user_portraitView.center = centerPoint;
}


@end
