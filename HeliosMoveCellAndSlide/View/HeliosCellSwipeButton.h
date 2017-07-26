//
//  HeliosCellSwipeButton.h
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HeliosSwipeButtonClickBlock) (UIButton * clickButton);
@interface HeliosCellSwipeButton : UIButton
@property (nonatomic,copy)HeliosSwipeButtonClickBlock block;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image even:(HeliosSwipeButtonClickBlock )clickBlock;
@end
