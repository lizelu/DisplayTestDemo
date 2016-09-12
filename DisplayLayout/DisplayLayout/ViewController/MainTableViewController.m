//
//  MainTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "MainTableViewController.h"


@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)tapFirstButton:(id)sender {
    [self pushVC:@"AutolayoutTableViewController"];
}
- (IBAction)tapSecondButton:(id)sender {
    [self pushVC:@"CountHeightTableViewController"];
}
- (IBAction)tapThridButton:(id)sender {
    [self pushVC:@"FrameCountTableViewController"];
}
- (IBAction)tapFourthButton:(id)sender {
    [self pushVC:@"YYKitTableViewController"];
}
- (IBAction)tapFifthButton:(id)sender {
    [self pushVC:@"AsyncDisplayKitTableViewController"];
}

- (void)pushVC:(NSString *) vcName {
   UITableViewController * vc = [[NSClassFromString(vcName) alloc] init];
   [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
