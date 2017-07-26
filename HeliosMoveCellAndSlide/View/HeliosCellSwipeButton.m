//
//  HeliosCellSwipeButton.m
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "HeliosCellSwipeButton.h"
@implementation HeliosCellSwipeButton
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image even:(HeliosSwipeButtonClickBlock )clickBlock {
    if (self = [super init]){
        self.block = [clickBlock copy];
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        const CGFloat margin = 10.0f;
        CGSize textSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.titleLabel.font, NSForegroundColorAttributeName: self.titleLabel.textColor } context:nil].size;
        CGFloat width = image.size.width+margin > textSize.width+margin ? image.size.width+margin : textSize.width+margin;
        self.frame = CGRectMake(0.f, 0.f, width, image.size.height+textSize.height+margin);
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if(self.imageView.image){
        CGFloat height = self.frame.size.height;
        CGFloat weight = self.frame.size.width;
        
        CGSize imageSize = self.imageView.image.size;
        CGFloat imageAndTextMargin = 5.f;
        CGFloat margin = (height - imageSize.height - self.titleLabel.bounds.size.height - imageAndTextMargin)/2;
        self.imageView.frame = CGRectMake((weight-imageSize.width)/2, margin, imageSize.width, imageSize.height);
        // 计算文本frame
        CGRect titleLabelFrame = self.titleLabel.frame;
        titleLabelFrame.origin.x = 0;
        titleLabelFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + imageAndTextMargin;
        titleLabelFrame.size.width = weight;
        self.titleLabel.frame = titleLabelFrame;
    }
}
- (void)buttonClick:(UIButton *)button {
    if(self.block){
        self.block(button);
    }
}
@end
