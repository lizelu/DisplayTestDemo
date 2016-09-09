//
//  AutolayoutTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/8.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "AutolayoutTableViewController.h"
#import "AutolayoutTableViewCell.h"

@interface AutolayoutTableViewController ()
@end

@implementation AutolayoutTableViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 100.0;  //设置预估值
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;       //自动调整约束，性能非常低，灰常的卡
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutolayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutolayoutTableViewCell" forIndexPath:indexPath];
    [cell configCellData:self.dataSource[indexPath.row]];
    
    if (indexPath.row == self.dataSource.count - 30) {
        [self addTestData];
    }
    return cell;
}

#pragma mark - Prevate Method

@end
