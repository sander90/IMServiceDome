//
//  SDChatInputView.h
//  IMServiceDome
//
//  Created by shansander on 16/4/1.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KheightOfChatInput 45.0

@class Chat;
@interface SDChatInputView : UIView<UITextFieldDelegate>

@property (nonatomic, strong)UITextField * theInputTextField;

@property (nonatomic, strong,readonly) Chat *chat;

- (void)setChat:(Chat *)chat;
@end
