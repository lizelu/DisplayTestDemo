//
//  YYKitTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/12.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "YYKitTableViewController.h"
#define CELL_REUSE_ID @"YYKitTableViewCell"
@interface YYKitTableViewController ()

@end

@implementation YYKitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYKit";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

- (void)registerTableViewCell {
    [self.tableView registerClass:NSClassFromString([self getReuseIdentifier]) forCellReuseIdentifier:[self getReuseIdentifier]];
}


@end
