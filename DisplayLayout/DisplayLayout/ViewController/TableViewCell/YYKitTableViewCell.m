//
//  YYKitTableViewCell.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/12.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "YYKitTableViewCell.h"

@interface YYKitTableViewCell()
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) YYLabel *titleLable;
@property (strong, nonatomic) YYLabel *timeLabel;
@property (strong, nonatomic) YYTextView *contentTextView;
@end

@implementation YYKitTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (self.headerImageView == nil) {
            [self addHeaderImageView];
            [self addTitle];
            [self addTime];
            [self addTextView];
        }
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

- (void)addTitle {
    self.titleLable = [[YYLabel alloc] initWithFrame:CGRectMake(70, 10, 50, 15)];
    self.titleLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titleLable];
}

- (void)addTime {
    self.timeLabel = [[YYLabel alloc] initWithFrame:CGRectMake(70, 30, 150, 15)];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.timeLabel];
}

- (void)addTextView {
    self.contentTextView = [[YYTextView alloc] initWithFrame:CGRectMake(15, 60, SCREEN_WIDTH - 30, 10)];
    self.contentTextView.font = [UIFont systemFontOfSize:14];
    self.contentTextView.editable = NO;
    self.contentTextView.scrollEnabled = NO;
    [self addSubview:self.contentTextView];
}

- (void)configCellData:(TestDataModel *)model {
    //[[YYMemoryCache alloc] init];
    //[self.headerImageView setImage:[YYImage imageNamed:model.imageName]];     //直接创建
    
    [self.headerImageView setImage:[[ImageCache shareInstance] getCacheYYImage:model.imageName]];
    [self.titleLable setText:model.title];
    [self.timeLabel setText:model.time];
    self.contentTextView.height = model.textHeight;
    self.contentTextView.attributedText = model.attributeContent;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

