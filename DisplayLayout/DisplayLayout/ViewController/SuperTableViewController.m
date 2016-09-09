//
//  SuperTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "SuperTableViewController.h"
#import "DataSupport.h"
@interface SuperTableViewController ()
@property (nonatomic, strong) DataSupport *dataSupport;
@end

@implementation SuperTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataSupport];
}

- (void)createDataSupport {
    self.dataSupport = [[DataSupport alloc] init];
    __weak typeof (self) weak_self = self;
    [self.dataSupport setUpdataDataSourceBlock:^(NSMutableArray *dataSource) {
        weak_self.dataSource = dataSource;
        [weak_self.tableView reloadData];
    }];
    [self addTestData];
}

- (void)addTestData {
    [self.dataSupport addTestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"释放");
}

@end
