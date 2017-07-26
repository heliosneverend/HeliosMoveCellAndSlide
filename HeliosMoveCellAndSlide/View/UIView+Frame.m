//
//  UIView+Frame.m
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat )x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat )y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat )width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat )width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat )height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat )height {
    CGRect frame = self.frame;
    frame.size.width = height;
    self.frame = frame;
}
@end
