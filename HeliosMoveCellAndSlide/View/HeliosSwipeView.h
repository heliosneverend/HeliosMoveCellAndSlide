//
//  HeliosSwipeView.h
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeliosCellSwipeButton.h"
@interface HeliosSwipeView : UIView
- (instancetype)initWithSwipeButtons:(NSArray<HeliosCellSwipeButton *> *)swipeButtons height:(CGFloat)height;
@end
