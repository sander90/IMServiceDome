//
//  SDChatContentView.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatContentView.h"
#import "SDChatModel.h"

@implementation SDChatContentView

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithChatModel:(SDChatModel *)cm
{
    self = [super init];
    if (self) {
        _chatModel = cm;
        CGFloat widthOfchatContent = self.chatModel.widthOfContentMessage;
        CGFloat heightOfchatContent = self.chatModel.heightOfCell ;
        self.frame = CGRectMake(0, 0, widthOfchatContent, heightOfchatContent);
        
        self.thebackImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        if (cm.type == Chat_Friend) {
            [self buildingLeftChatContentView];
        }else{
            [self buildingRightChatContentView];
        }
    }
    return self;
}

- (void)setupChatModel:(SDChatModel * )cm
{
    _chatModel = cm;
    CGFloat widthOfchatContent = self.chatModel.widthOfContentMessage;
    CGFloat heightOfchatContent = self.chatModel.heightOfCell ;
    self.frame = CGRectMake(0, 0, widthOfchatContent, heightOfchatContent);
    self.backgroundColor = [UIColor clearColor];
    self.thebackImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.thebackImageView];
    
    if (cm.type == Chat_Friend) {
        [self buildingLeftChatContentView];
    }else{
        [self buildingRightChatContentView];
    }
}
- (void)buildingLeftChatContentView
{
    CGFloat centerX = KWidthOfPortraitAndSpacing + self.frame.size.width /2.0f;
    CGFloat centerY = self.frame.size.height / 2.0f + self.frame.origin.y;
    self.center = CGPointMake(centerX, centerY);
    UIImage * leftImage = [UIImage imageNamed:kLeftBackGroupImageViewName];
    UIEdgeInsets edge = UIEdgeInsetsMake(leftImage.size.height /2.0f + 10, leftImage.size.width /2.0f - 1, leftImage.size.height/2.0f - 5, leftImage.size.width/2.0f + 1);
    leftImage = [leftImage resizableImageWithCapInsets:edge];
    [self.thebackImageView setImage:leftImage];
    
}
- (void)buildingRightChatContentView
{
    CGRect selfRect = [[UIScreen mainScreen] bounds];
    CGFloat centerX = selfRect.size.width - KWidthOfPortraitAndSpacing - self.frame.size.width /2.0f;
    CGFloat centerY = self.frame.size.height / 2.0f + self.frame.origin.y;
    self.center = CGPointMake(centerX, centerY);
    UIImage * rightImage = [UIImage imageNamed:kRightBackGroupImageViewName];
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    UIEdgeInsets edge = UIEdgeInsetsMake(rightImage.size.height/2.0f + 10 , rightImage.size.width/2.0f - 1, rightImage.size.height/2.0f - 5, rightImage.size.width/2.0f + 1);
    rightImage = [rightImage resizableImageWithCapInsets:edge];
    [self.thebackImageView setImage:rightImage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
