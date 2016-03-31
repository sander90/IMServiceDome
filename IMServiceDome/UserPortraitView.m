//
//  UserPortraitView.m
//  IMServiceDome
//
//  Created by shansander on 16/3/31.
//  Copyright © 2016年 shansander. All rights reserved.
//

#import "UserPortraitView.h"

@implementation UserPortraitView

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, sizeOfPortraitRect, sizeOfPortraitRect);
        self.backgroundColor = [UIColor redColor];
        [self buildingPortraitView];
    }
    return self;
}
- (void)buildingPortraitView
{
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = [self GetRoundPATHOfPortrait];
    self.layer.mask = layer;
}
- (CGPathRef)GetRoundPATHOfPortrait{

    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.bounds.origin.x + self.bounds.size.width/2.0f, self.bounds.origin.y + self.bounds.size.height/2.0f) radius:self.bounds.size.width/2.0f startAngle:0 endAngle:2 * M_PI clockwise:YES];
    return path.CGPath;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
