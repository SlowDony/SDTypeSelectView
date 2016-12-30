//
//  BigDuiGouTableViewCell.m
//  tcrj_tcyun
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "BigDuiGouTableViewCell.h"

@implementation BigDuiGouTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //label
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 0, mDeviceWidth-20-20, 35);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:15];
        label.numberOfLines = 0;
        label.textColor=fontHightColor;
        self.cellLabel=label;
        [self addSubview:label];
        //
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(mDeviceWidth-20,(35-15)/2, 15, 15);
        
        imageView.image = [UIImage imageNamed:@"客户管理筛选三列_03"];
        self.cellDuiGouImage =imageView;
        //        imageView.backgroundColor=[UIColor redColor];
        [self addSubview:imageView];
    }
    return self;
}
-(void)setModle:(BOOL)isBool
{
    //    self.cellDuiGouImage.hidden=!isBool;
    
    if (isBool)
    {
        self.cellDuiGouImage.hidden=NO;
        self.cellLabel.textColor=fontHightYelloColor;
        self.backgroundColor=[UIColor whiteColor];
    }
    else
    {
        self.cellDuiGouImage.hidden=YES;
        self.cellLabel.textColor=fontHightColor;
        self.backgroundColor=bjColor;

    }
}

-(void)setNoDuiGouModle:(BOOL)isBool
{
    //    self.cellDuiGouImage.hidden=!isBool;
    
    if (isBool)
    {
        self.cellDuiGouImage.hidden=YES;
        self.cellLabel.textColor=fontHightYelloColor;
        self.backgroundColor=[UIColor whiteColor];
    }
    else
    {
        self.cellDuiGouImage.hidden=YES;
        self.cellLabel.textColor=fontHightColor;
        self.backgroundColor=bjColor;
        
    }
}


@end
