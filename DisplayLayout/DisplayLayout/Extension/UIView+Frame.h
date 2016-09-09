//
//  UIView+Frame.h
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/**
 * 快捷方式： frame.origin.x.
 *
 * 设置 frame.origin.x = x
 */
@property (nonatomic, assign) CGFloat x;

/**
 * 快捷方式： frame.origin.y.
 *
 * 设置 frame.origin.y = y
 */
@property (nonatomic, assign) CGFloat y;


/**
 * 快捷方式： frame.size.width
 *
 * 设置 frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * 快捷方式： frame.size.height
 *
 * 设置 frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * 快捷方式： frame.origin.x + frame.size.width
 *
 * 设置 frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * 快捷方式： frame.origin.y + frame.size.height
 *
 * 设置 frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * 快捷方式： center.x
 *
 * 设置 center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * 快捷方式： center.y
 *
 * 设置 center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * 快捷方式： frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * 快捷方式： frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;

@end
