//
//  DataSupport.h
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^UpdateDataSourceBlock)(NSMutableArray *dataSource);
@interface DataSupport : NSObject
- (void)setUpdataDataSourceBlock:(UpdateDataSourceBlock) updateDataBlock;
- (void)addTestData;
@end
