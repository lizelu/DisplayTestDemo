//
//  AutolayoutTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/8.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "AutolayoutTableViewController.h"
#define CELL_REUSE_ID @"AutolayoutTableViewCell"
@interface AutolayoutTableViewController ()
@end

@implementation AutolayoutTableViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AotomaticDimension";
    self.tableView.estimatedRowHeight = 100.0;  //设置预估值
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;       //自动调整约束，性能非常低，灰常的卡
}

#pragma mark - Override Super Method

- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
