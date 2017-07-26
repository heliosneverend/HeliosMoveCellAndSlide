//
//  HeliosTableViewCell.h
//  HeliosMoveCellAndSlide
//
//  Created by beyo-zhaoyf on 2017/7/26.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeliosSwipeView.h"
typedef NS_ENUM(NSUInteger, HeliosSwipeViewAnimatedStyle) {
    HeliosSwipeViewAnimatedStyleNone,    // 无同步动画效果,类似系统的效果
    HeliosSwipeViewAnimatedStyleDefault, // 默认 进度滑动
    HeliosSwipeViewAnimatedStyleOverlap, // 重叠渐变出现
    HeliosSwipeViewAnimatedStyleParallax // 不完全同步滚动效果, 类似系统导航栏滑动返回效果
};
@protocol HeliosSwipeTableViewCellDelegate <NSObject>
@required

/**
 *  左滑cell时显示的button 返回nil表示不创建左边菜单
 *
 *  @param indexPath cell的位置
 */
- (NSArray<HeliosCellSwipeButton *> *)tableView:(UITableView *)tableView leftSwipeButtonsAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  右滑cell时显示的button 返回nil表示不创建右边菜单
 *
 *  @param indexPath cell的位置
 */
- (NSArray<HeliosCellSwipeButton *> *)tableView:(UITableView *)tableView rightSwipeButtonsAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface HeliosTableViewCell : UITableViewCell
@property (weak, nonatomic) id<HeliosSwipeTableViewCellDelegate> delegate;
/** 滑动时的动画类型 默认为 ZJSwipeViewAnimatedStyleDefault*/
@property (assign, nonatomic) HeliosSwipeViewAnimatedStyle swipeViewAnimatedStyle;
/** 是否在滑动时关闭其他已经打开的滑动菜单 默认YES */
@property (assign, nonatomic, getter=isCloseOtherCellSwipeViewWhenOpenSwipeView) BOOL closeOtherCellSwipeViewWhenOpenSwipeView;
/** 松开手时决定是否取消还是完成返回的临界比例 (0,1)  -- 滑动了多少距离  默认为0.5 */
@property (assign, nonatomic) CGFloat threholdPercent;
/** 松开手时决定是否取消还是完成返回的临界速度 >=0 默认为200 */
@property (assign, nonatomic) CGFloat threholdSpeed;
/** 动画时间 默认为0.25s */
@property (assign, nonatomic) CGFloat animatedDuration;
/** 添加的覆盖view的背景色 默认为白色 */
@property (strong, nonatomic) UIColor *overlayerBackgroundColor;
@end
