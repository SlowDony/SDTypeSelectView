//
//  DuiGouTableViewCell.m
//  tcrj_tcyun
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DuiGouTableViewCell.h"

@implementation DuiGouTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //label
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 0, mDeviceWidth/2-20-20, 35);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor=fontHightColor;
        label.numberOfLines = 0;
        self.cellLabel=label;
        [self addSubview:label];
        //
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(mDeviceWidth/2-20,(35-15)/2, 15, 15);
        
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
    }
    else
    {
        self.cellDuiGouImage.hidden=YES;
        self.cellLabel.textColor=fontHightColor;
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

-(void)setCellLabelHangHight:(NSString *)text{
    
    if (text.length==0){
        
        CGRect frame =[self frame];
        self.frame=frame;
        
    }else {
        CGRect frame =[self frame];
        CGSize labelSize =CGSizeMake(mDeviceWidth/2-20-20, 1000);
        self.cellLabel.text=text;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.cellLabel.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:2];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.cellLabel.text.length)];
        self.cellLabel.attributedText = attributedString;
        
        CGSize size =[self.cellLabel sizeThatFits:labelSize];
        
//        DLog(@"size.height:%f",size.height);
        
        if (size.height<35){
            
            if (size.height==32){
                
                self.cellLabel.frame = CGRectMake(self.cellLabel.frame.origin.x, self.cellLabel.frame.origin.y, self.cellLabel.frame.size.width, 35);
                
                self.cellDuiGouImage.frame =CGRectMake(self.cellDuiGouImage.frame.origin.x, (35-15)/2, self.cellDuiGouImage.frame.size.width, self.cellDuiGouImage.frame.size.height);
                
                frame.size.height=35;
                
            }else {
                self.cellLabel.frame = CGRectMake(self.cellLabel.frame.origin.x, self.cellLabel.frame.origin.y, self.cellLabel.frame.size.width, 35);
                self.cellDuiGouImage.frame =CGRectMake(self.cellDuiGouImage.frame.origin.x, (35-15)/2, self.cellDuiGouImage.frame.size.width, self.cellDuiGouImage.frame.size.height);
                
                frame.size.height=35;
//                self.cellRightLab.frame = CGRectMake(self.cellRightLab.frame.origin.x, self.cellRightLab.frame.origin.y, self.cellRightLab.frame.size.width, 42);
//                self.cellLeftLab.frame =CGRectMake(self.cellLeftLab.frame.origin.x, self.cellLeftLab.frame.origin.y, self.cellLeftLab.frame.size.width, 42);
//                self.cellImage.frame =CGRectMake(self.cellImage.frame.origin.x, (42-15)/2, self.cellImage.frame.size.width, self.cellImage.frame.size.height);
//                self.cellLine.frame =CGRectMake(self.cellLine.frame.origin.x, 41, self.cellLine.frame.size.width, self.cellLine.frame.size.height);
//                frame.size.height=42;
//                
            }
        }else {
            self.cellLabel.frame = CGRectMake(self.cellLabel.frame.origin.x, self.cellLabel.frame.origin.y, self.cellLabel.frame.size.width, size.height+20);
            
            self.cellDuiGouImage.frame =CGRectMake(self.cellDuiGouImage.frame.origin.x, (size.height-15+20)/2, self.cellDuiGouImage.frame.size.width, self.cellDuiGouImage.frame.size.height);
            frame.size.height=size.height+20;
        }
        
        
        
        self.frame=frame;
        
    }

    
}



@end
