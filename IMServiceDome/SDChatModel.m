//
//  SDChatModel.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatModel.h"

@implementation SDChatModel

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithContent:(NSString * )message andChatModel:(SDChatType)st
{
    self = [super init];
    if (self) {
        _type = st;
        _content = message;
        [self analysisContentMessage];
    }
    return self;
}
// 分析聊天内容。
- (void)analysisContentMessage
{
    UIFont *font = [UIFont systemFontOfSize:kSIZEOFCONTENTFONT];
    NSDictionary * attributes = @{NSFontAttributeName:font};
    
    CGRect selfRect = [[UIScreen mainScreen] bounds];
    
    CGFloat maxwidthoFcontent = selfRect.size.width - KWidthOfPortraitAndSpacing;
    
    CGFloat minHeihgtOFcontent = 40.0f;
    
    CGRect contentRect = [self.content boundingRectWithSize:CGSizeMake(maxwidthoFcontent, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    _heightOfCell = contentRect.size.height + kHeightOfSpacing;
    
    if (_heightOfCell < minHeihgtOFcontent) {
        _heightOfCell = minHeihgtOFcontent;
    }
    
    _widthOfContentMessage = contentRect.size.width + kWidthOfSpacing;
    
    if (_widthOfContentMessage > maxwidthoFcontent) {
        
        _widthOfContentMessage = maxwidthoFcontent;
    }
}

@end
