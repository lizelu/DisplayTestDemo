//
//  FrameCountTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "FrameCountTableViewController.h"
#import "FrameLayoutTableViewCell.h"

#define CELL_REUSE_ID @"FrameLayoutTableViewCell"

@interface FrameCountTableViewController ()

@end

@implementation FrameCountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataSource.count) {
        TestDataModel *model = self.dataSource[indexPath.row];
        return model.cellHeight;
    }
    return 100;
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

- (void)registerTableViewCell {
    [self.tableView registerClass:NSClassFromString(CELL_REUSE_ID) forCellReuseIdentifier:CELL_REUSE_ID];
}


@end
