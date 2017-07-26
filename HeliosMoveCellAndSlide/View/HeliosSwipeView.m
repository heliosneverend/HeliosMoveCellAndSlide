//
//  HeliosSwipeView.m
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "HeliosSwipeView.h"

@implementation HeliosSwipeView

- (instancetype)initWithSwipeButtons:(NSArray<HeliosCellSwipeButton *> *)swipeButtons height:(CGFloat)height {
    if (self = [super init]) {
        
        CGFloat btnX = 0.f;
        CGFloat allBtnWidth = 0.f;
    
        for (HeliosCellSwipeButton *button in [swipeButtons reverseObjectEnumerator]) {
            [self addSubview:button];
            
            button.frame = CGRectMake(btnX, 0, button.bounds.size.width, height);
            btnX += button.bounds.size.width;
            allBtnWidth += button.bounds.size.width;
        }
        // 设置frame 宽高有效, x, y在swipeTableViewCell中还会相应的调整
        self.frame = CGRectMake(0.f, 0.f, allBtnWidth, height);
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


@end
