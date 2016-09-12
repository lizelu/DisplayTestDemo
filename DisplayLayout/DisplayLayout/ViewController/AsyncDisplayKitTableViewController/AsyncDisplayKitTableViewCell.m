//
//  AsyncDisplayKitTableViewCell.m
//  DisplayLayout
//
//  Created by Mr.LuDashi on 16/9/12.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

#import "AsyncDisplayKitTableViewCell.h"

@interface AsyncDisplayKitTableViewCell()
@property (strong, nonatomic) ASImageNode *headerImageNode;
@property (strong, nonatomic) ASTextNode *titleTextNode;
@property (strong, nonatomic) ASTextNode *timeTextNode;
@property (strong, nonatomic) ASTextNode *contentTextNode;
@end

@implementation AsyncDisplayKitTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (self.headerImageNode == nil) {
            [self addHeaderImageView];
            [self addTitle];
            [self addTime];
            [self addTextView];
        }
    }
    return self;
}

- (void)addHeaderImageView {
    self.headerImageNode = [[ASImageNode alloc] init];
    self.headerImageNode.frame = CGRectMake(15, 8, 40, 40);
    self.headerImageNode.contentMode = UIViewContentModeScaleAspectFit;
    self.headerImageNode.layer.cornerRadius = self.headerImageNode.view.width / 2;
    self.headerImageNode.clipsToBounds = YES;
    [self addSubview:self.headerImageNode.view];
}

- (NSAttributedString *)getAttributeString:(CGFloat) fontSize {
    NSDictionary *titleNodeAttributes = @{
                                          NSFontAttributeName : [UIFont boldSystemFontOfSize:15.0],
                                          NSForegroundColorAttributeName : [UIColor blackColor]
                                          };
    return [[NSAttributedString alloc] initWithString:@"" attributes:titleNodeAttributes];

}

- (void)addTitle {
    self.titleTextNode = [[ASTextNode alloc] init];
    self.titleTextNode.frame = CGRectMake(70, 10, 50, 15);
    self.titleTextNode.attributedText = [self getAttributeString:15];
    
    [self addSubview:self.titleTextNode.view];
}

- (void)addTime {
    self.timeTextNode = [[ASTextNode alloc] init];
    self.timeTextNode.frame = CGRectMake(70, 30, 150, 15);
    self.timeTextNode.attributedText = [self getAttributeString:14];
    [self addSubview:self.timeTextNode.view];
}

- (void)addTextView {
    self.contentTextNode = [[ASTextNode alloc] init];
    self.contentTextNode.frame = CGRectMake(15, 60, SCREEN_WIDTH - 30, 10);
    self.contentTextNode.attributedText = [self getAttributeString:14];
    [self addSubview:self.contentTextNode.view];
}

- (void)configCellData:(TestDataModel *)model {
    //[self.headerImageView setImage:[UIImage imageNamed:model.imageName]];     //直接创建
    
    [self.headerImageNode setImage:[[ImageCache shareInstance] getCacheImage:model.imageName]];
    self.titleTextNode.attributedText = model.attributeTitle;
    self.timeTextNode.attributedText = model.attributeTime;
    self.contentTextNode.attributedText = model.attributeContent;
    self.contentTextNode.view.height = model.textHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end