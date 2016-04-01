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
        
        if (cm.type == Chat_Friend) {
            [self buildingLeftChatContentView];
        }else{
            [self buildingRightChatContentView];
        }
    }
    return self;
}
- (void)buildingLeftChatContentView
{
    
}
- (void)buildingRightChatContentView
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
