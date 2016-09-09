//
//  CountHeightTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "CountHeightTableViewController.h"
#define CELL_REUSE_ID @"AutolayoutTableViewCell"
@interface CountHeightTableViewController ()
@property (nonatomic, strong) NSMutableArray *heightArray;
@end

@implementation CountHeightTableViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.estimatedRowHeight = 100.0;  //设置预估值
    [self registerTableViewCell];
    self.heightArray = [[NSMutableArray alloc] init];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataSource.count) {
        TestDataModel *model = self.dataSource[indexPath.row];
        return model.textHeight;
    }
    return 100;
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

- (void)registerTableViewCell {
    UINib *cellNib = [UINib nibWithNibName:@"AutolayoutTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:CELL_REUSE_ID];
}


@end
