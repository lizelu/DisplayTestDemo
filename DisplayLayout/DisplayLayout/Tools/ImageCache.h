//
//  ImageCache.h
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject
+ (instancetype)shareInstance;
- (id)getCacheImage: (NSString *)key;
- (id)getCacheYYImage: (NSString *)key;
@end
