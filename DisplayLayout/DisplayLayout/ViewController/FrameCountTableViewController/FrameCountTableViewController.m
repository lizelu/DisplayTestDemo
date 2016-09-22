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
    self.title = @"FrameLayoutCountHeight";
    // Do any additional setup after loading the view.
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
