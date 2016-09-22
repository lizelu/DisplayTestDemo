//
//  AsyncDisplayKitTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/12.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "AsyncDisplayKitTableViewController.h"
#define CELL_REUSE_ID @"AsyncDisplayKitTableViewCell"
@interface AsyncDisplayKitTableViewController ()

@end

@implementation AsyncDisplayKitTableViewController

- (void)viewDidLoad {
    self.title = @"AsyncDisplayKit";
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
