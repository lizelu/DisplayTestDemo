//
//  AutolayoutTableViewCell.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/8.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "AutolayoutTableViewCell.h"
@interface AutolayoutTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UITextView *contentLabel;

@end

@implementation AutolayoutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2;
    self.headerImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configCellData:(TestDataModel *)model {
    //[self.headerImageView setImage:[UIImage imageNamed:model.imageName]];     //直接创建
    
    [self.headerImageView setImage:[[ImageCache shareInstance] getCacheImage:model.imageName]];
    [self.titleLable setText:model.title];
    [self.timeLabel setText:model.time];
    [self.contentLabel setText:model.content];
}

@end
