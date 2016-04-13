//
//  SDChatInputView.m
//  IMServiceDome
//
//  Created by shansander on 16/4/1.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "SDChatInputView.h"

#import "Chat.h"
#import "RoomChat.h"

@implementation SDChatInputView

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildingInputBaseView];
    }
    return self;
}
- (void)buildingInputBaseView
{
    CGRect textframe = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.theInputTextField = [[UITextField alloc] initWithFrame:textframe];
    [self addSubview:self.theInputTextField];
    self.theInputTextField.delegate = self;
    self.theInputTextField.placeholder = @"请输入";
    self.theInputTextField.returnKeyType = UIReturnKeySend;
    
}

- (void)setChat:(Chat *)chat
{
    _chat = chat;
}

- (void)onSendMessage
{
    NSString* message = self.theInputTextField.text;
    if ([self.chat isKindOfClass:[RoomChat class]]) {
        RoomChat * rc = (RoomChat*)self.chat;
        [rc sendRoomMessage:message];
    }else{
        [self.chat sendMessage:message];

    }
}
#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        
        [self onSendMessage];
        textField.text = @"";
    }
    return YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
