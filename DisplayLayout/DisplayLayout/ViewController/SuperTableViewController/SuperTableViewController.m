//
//  SuperTableViewController.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "SuperTableViewController.h"
#import "DataSupport.h"
@interface SuperTableViewController ()
@property (nonatomic, strong) DataSupport *dataSupport;
@end

@implementation SuperTableViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
    [self registerTableViewCell];
    [self createDataSupport];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"释放");
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < self.dataSource.count) {
        TestDataModel *model = self.dataSource[indexPath.row];
        return model.cellHeight;
    }
    return 100;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SuperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getReuseIdentifier] forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[SuperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self getReuseIdentifier]];
    }
    [cell configCellData:self.dataSource[indexPath.row]];
    
    if (indexPath.row == self.dataSource.count - 30) {
        [self addTestData];
    }
    return cell;
}


#pragma mark - Private Method

/**
 *  对TableView进行优化
 */
- (void)configTableView {
    self.tableView.delaysContentTouches = NO;
    self.tableView.canCancelContentTouches = YES;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Remove touch delay (since iOS 8)
    UIView *wrapView = self.tableView.subviews.firstObject;
    
    // UITableViewWrapperView -- UITableViewCell的父类
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            // UIScrollViewDelayedTouchesBeganGestureRecognizer - 禁掉该手势
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }

}

- (void)createDataSupport {
    self.dataSupport = [[DataSupport alloc] init];
    __weak typeof (self) weak_self = self;
    [self.dataSupport setUpdataDataSourceBlock:^(NSMutableArray *dataSource) {
        weak_self.dataSource = dataSource;
        [weak_self.tableView reloadData];
    }];
    [self addTestData];
}

- (void)addTestData {
    [self.dataSupport addTestData];
}

/**
 *  子类提供具体的cell重用符, 默认是AutolayoutTableViewCell
 */
#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return @"";
}

- (void)registerTableViewCell {
    
    
    if ([[self getReuseIdentifier] isEqualToString:@"AutolayoutTableViewCell"]) {
        UINib *cellNib = [UINib nibWithNibName:[self getReuseIdentifier] bundle:[NSBundle mainBundle]];
        [self.tableView registerNib:cellNib forCellReuseIdentifier:[self getReuseIdentifier]];
    } else {
        [self.tableView registerClass:NSClassFromString([self getReuseIdentifier]) forCellReuseIdentifier:[self getReuseIdentifier]];
    }
}

@end
