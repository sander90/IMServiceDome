//
//  SDChatModel.h
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Chat_Friend,
    Chat_Me,
}SDChatType;

#define kSIZEOFCONTENTFONT 17

#define kHeightOfSpacing 5

#define kWidthOfSpacing 25.0

#define KWidthOfPortraitAndSpacing 45.0f


@interface SDChatModel : NSObject
/**
 * 区分是我的内容，还是朋友的内容
 */
@property (nonatomic,assign,readonly)SDChatType type;
/**
 * 聊天内容
 */
@property (nonatomic,strong,readonly)NSString * content;
/**
 * 朋友的头像名字
 */
@property (nonatomic,strong,readonly)NSString * friendIconImageName;
/**
 * cell的高度
 */
@property (nonatomic, assign,readonly) CGFloat heightOfCell;
/**
 * 聊天内容的宽度
 */
@property (nonatomic, assign, readonly) CGFloat widthOfContentMessage;

- (id)initWithContent:(NSString * )message andChatModel:(SDChatType)st;

@end
