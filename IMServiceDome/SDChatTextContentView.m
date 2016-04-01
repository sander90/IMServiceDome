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
    [super setupChatModel:cm];
    
    UIFont * font = [UIFont systemFontOfSize:kSIZEOFCONTENTFONT];
    self.theTextlabel = [[UILabel alloc] init];
    self.theTextlabel.frame = CGRectMake(kWidthOfSpacing - 10, kHeightOfSpacing/2.0f, cm.widthOfContentMessage - 20, cm.heightOfCell - kHeightOfSpacing);
    self.theTextlabel.text = cm.content;
    [self.theTextlabel setFont:font];
    self.theTextlabel.numberOfLines = 0;
    [self addSubview:self.theTextlabel];
    
}
- (void)buildingLeftChatContentView
{
    [super buildingLeftChatContentView];
    
}
- (void)buildingRightChatContentView
{
    [super buildingRightChatContentView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
