//
//  DataSupport.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "DataSupport.h"
#import "TestDataModel.h"
#define contentText @"成长是一场冒险，勇敢的人先上路，代价是错过风景，不能回头，成长是一场游戏，勇敢的人先开始，不管难过与快乐，不能回头，行歌，在草长莺飞的季节里喃喃低唱，到处人潮汹涌还会孤独怎么，在灯火阑珊处竟然会觉得荒芜，从前轻狂绕过时光，成长是一场冒险，勇敢的人先上路，代价是错过风景，不能回头，成长是一场游戏，勇敢的人先开始，不管难过与快乐，不能回头，行歌，谁在一边走一边唱一边回头张望，那些苦涩始终都要去尝，怎么，长大后不会大笑也不会再大哭了，从前轻狂绕过时光，让我们彼此分享互相陪伴吧，一起面对人生这一刻的孤独吧，行歌，在草长莺飞的季节里喃喃低唱，从前轻狂绕过时光.成长是一场冒险，勇敢的人先上路，代价是错过风景，不能回头，成长是一场游戏，勇敢的人先开始，不管难过与快乐，不能回头，行歌，在草长莺飞的季节里喃喃低唱，到处人潮汹涌还会孤独怎么，在灯火阑珊处竟然会觉得荒芜，从前轻狂绕过时光，成长是一场冒险，勇敢的人先上路，代价是错过风景，不能回头，成长是一场游戏，勇敢的人先开始，不管难过与快乐，不能回头，行歌，谁在一边走一边唱一边回头张望，那些苦涩始终都要去尝，怎么，长大后不会大笑也不会再大哭了，从前轻狂绕过时光，让我们彼此分享互相陪伴吧，一起面对人生这一刻的孤独吧，行歌，在草长莺飞的季节里喃喃低唱，从前轻狂绕过时光"

@interface DataSupport()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UpdateDataSourceBlock updateDataBlock;
@end

@implementation DataSupport

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)setUpdataDataSourceBlock:(UpdateDataSourceBlock) updateDataBlock {
    self.updateDataBlock = updateDataBlock;
}

#pragma mark - Prevate Method
- (void)addTestData {
    if (self.dataSource == nil) {
        self.dataSource = [[NSMutableArray alloc] initWithCapacity:50];
    }
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("zeluli.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_semaphore_t lock = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 50; i ++) {
        dispatch_group_async(group, concurrentQueue, ^{
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            [self createTestModel];
            dispatch_semaphore_signal(lock);
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self updateDataSource];
    });
}

- (void)createTestModel {
    TestDataModel * model = [[TestDataModel alloc] init];
    model.title = @"行歌";
    
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    model.time = [dataFormatter stringFromDate:[NSDate date]];
    
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", arc4random()%5];
    model.imageName =imageName;
    
    NSInteger endIndex = arc4random()%contentText.length;
    model.content = [contentText substringToIndex:endIndex];
    
    [self.dataSource addObject:model];
}

- (void)updateDataSource {
    if (self.updateDataBlock != nil) {
        self.updateDataBlock(self.dataSource);
    }
}

@end
