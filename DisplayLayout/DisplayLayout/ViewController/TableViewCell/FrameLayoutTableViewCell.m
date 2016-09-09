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
@property (strong, nonatomic) UITextView *contentTextView;
@end

@implementation FrameLayoutTableViewCell

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
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 50, 15)];
    self.titleLable.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titleLable];
}

- (void)addTime {
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 150, 15)];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.timeLabel];
}

- (void)addTextView {
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 60, SCREEN_WIDTH - 30, 10)];
    self.contentTextView.font = [UIFont systemFontOfSize:14];
    self.contentTextView.editable = NO;
    self.contentTextView.scrollEnabled = NO;
    [self addSubview:self.contentTextView];
}

- (void)configCellData:(TestDataModel *)model {
    //[self.headerImageView setImage:[UIImage imageNamed:model.imageName]];     //直接创建
    
    [self.headerImageView setImage:[[ImageCache shareInstance] getCacheImage:model.imageName]];
    [self.titleLable setText:model.title];
    [self.timeLabel setText:model.time];
    [self.contentTextView setText:model.content];
    self.contentTextView.height = model.textHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
