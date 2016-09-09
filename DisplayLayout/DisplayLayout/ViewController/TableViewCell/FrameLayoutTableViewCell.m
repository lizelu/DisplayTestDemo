//
//  FrameLayoutTableViewCell.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/9.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "FrameLayoutTableViewCell.h"
@interface FrameLayoutTableViewCell()
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UITextView *contentLabel;
@end

@implementation FrameLayoutTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addHeaderImageView];
    }
    return self;
}

- (void)addHeaderImageView {
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 8, 40, 40)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.headerImageView.layer.cornerRadius = self.headerImageView.width / 2;
    self.headerImageView.clipsToBounds = YES;
    [self addSubview:self.headerImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
