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
@end

@implementation CountHeightTableViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayoutCountHeight";
}

#pragma mark - UITableViewDelegate

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
