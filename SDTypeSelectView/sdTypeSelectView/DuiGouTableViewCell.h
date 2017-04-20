//
//  DuiGouTableViewCell.h
//  tcrj_tcyun
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuiGouTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *cellDuiGouImage;

@property (nonatomic,strong)UILabel *cellLabel;

/**
 初始化cell

 @param tableView 父类列表
 @return cell单元格
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setModle:(BOOL)isBool;
-(void)setNoDuiGouModle:(BOOL)isBool;
-(void)setCellLabelHangHight:(NSString *)text;
@end
