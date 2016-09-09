//
//  CountHeightTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "CountHeightTableViewController.h"
#import "AutolayoutTableViewCell.h"
@interface CountHeightTableViewController ()
@property (nonatomic, strong) NSMutableArray *heightArray;
@end

@implementation CountHeightTableViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.estimatedRowHeight = 100.0;  //设置预估值
    [self registerAutolayoutTableViewCell];
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

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutolayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutolayoutTableViewCell" forIndexPath:indexPath];
    [cell configCellData:self.dataSource[indexPath.row]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (indexPath.row == self.dataSource.count - 30) {
            [self addTestData];
        }
    });
    
    return cell;
}


@end
