//
//  SDChatTextContentView.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatTextContentView.h"
#import "SDChatModel.h"

@implementation SDChatTextContentView

- (id)initWithChatModel:(SDChatModel *)cm
{
    self = [super initWithChatModel:cm];
    if (self) {
        
    }
    return self;
}
- (void)setupChatModel:(SDChatModel *)cm
{
    
    UIFont * font = [UIFont systemFontOfSize:kSIZEOFCONTENTFONT];
    self.theTextlabel = [[UILabel alloc] init];
    self.theTextlabel.text = cm.content;
    [self.theTextlabel setFont:font];
    self.theTextlabel.numberOfLines = 0;
    [super setupChatModel:cm];
    [self addSubview:self.theTextlabel];

    
}
- (void)buildingLeftChatContentView
{
    [super buildingLeftChatContentView];
    self.theTextlabel.frame = CGRectMake(kWidthOfSpacing - 10, kHeightOfSpacing/3.0f, self.chatModel.widthOfContentMessage - 30, self.chatModel.heightOfCell - kHeightOfSpacing);

}
- (void)buildingRightChatContentView
{
    [super buildingRightChatContentView];
    
    self.theTextlabel.frame = CGRectMake(7, kHeightOfSpacing/3.0f, self.chatModel.widthOfContentMessage - 30, self.chatModel.heightOfCell - kHeightOfSpacing);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
