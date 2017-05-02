//
//  SDSelectView.m
//  SDTypeSelectView
//
//  Created by Megatron Joker on 2017/4/25.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDSelectView.h"
#import "SDLeftTableView.h"
#import "SDRightTableView.h"

@interface SDSelectView ()

@property (nonatomic,strong)SDLeftTableView *leftView;
@property (nonatomic,strong)SDRightTableView *rightView;
@end
@implementation SDSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame addDataArr:(NSMutableArray *)mutableArr{
    
    self =[super initWithFrame:frame];
    if (self){
        
        self.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.5];
        self.userInteractionEnabled=YES;
        //
        UIView *bjView =[[UIView alloc]init];
        bjView.backgroundColor=mHexRGB(0xe4e4e4);
        
        
        bjView.frame=CGRectMake(0, 0, self.frame.size.width, 0);
        [self addSubview:bjView];
        
        
        [self setLeftView:[SDLeftTableView tableViewWithFrame:CGRectMake(0, 0,self.frame.size.width/2, 0)]];
        NSMutableArray *leftArr =[[NSMutableArray alloc]initWithArray:mutableArr];
        [self.leftView setLeftArr:leftArr];
        [bjView addSubview:self.leftView];
        
        typeof(self) __weak weakSelf =self;
        [self.leftView setLeftArrDidSelectHandler:^(NSArray *arr){
            NSMutableArray *rightArr =[[NSMutableArray alloc]initWithArray:arr];
            [weakSelf.rightView setRightArr:rightArr];
        
        }];
        
        self.rightView =[SDRightTableView tableViewWithFrame:CGRectMake(self.frame.size.width/2, 0,self.frame.size.width/2, 0)];
        
        self.rightView.backgroundColor = [UIColor whiteColor];

        [bjView addSubview:self.rightView];
        
        
        //重置
        UIButton *chongZhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        chongZhiBtn.frame = CGRectMake(self.frame.size.width-120,0,40, 0);
        [chongZhiBtn setTitle:@"重置" forState:UIControlStateNormal];
        [chongZhiBtn setTitleColor:fontHightColor forState:UIControlStateNormal];
        chongZhiBtn.tag=1001;
        chongZhiBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        [chongZhiBtn  addTarget:self action:@selector(chongzhiClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [bjView addSubview: chongZhiBtn];
        
        //确认
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(self.frame.size.width-60, 0, 40, 0);
        [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
        
        sureBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        
        [sureBtn  addTarget:self action:@selector(chongzhiClicked:) forControlEvents:UIControlEventTouchUpInside];
        sureBtn.tag=1002;
        [sureBtn setTitleColor:fontHightYelloColor forState:UIControlStateNormal];
        [bjView addSubview: sureBtn];
        
        [UIView animateWithDuration:0.4 animations:^{
            self.leftView.frame=CGRectMake(0, 0, self.frame.size.width/2, mutableArr.count*44);
            self.rightView.frame=CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, mutableArr.count*44);
            bjView.frame=CGRectMake(0, 0, self.frame.size.width, mutableArr.count*44+40);
            
            chongZhiBtn.frame = CGRectMake(self.frame.size.width-120,bjView.frame.size.height-40,40, 40);
            sureBtn.frame = CGRectMake(self.frame.size.width-60, bjView.frame.size.height-40, 40, 40);
            //            bjView.alpha=1;
            //            leftTableView.alpha=1;
            
        } completion:nil];
        
        
    }
    return self;
}


-(void)chongzhiClicked:(UIButton *)sender{
    
//    if([self.delegate respondsToSelector:@selector(SelectXialaViewBtn:)]){
//        [self.delegate SelectXialaViewBtn:sender];
//    }
    
    switch (sender.tag) {
        case 1001: //重置
        {
            
        }
            break;
        case 1002: //确认
        {
            [self remove];
        }
            break;
        default:
            break;
    }
}

-(void)remove{
    [self removeFromSuperview];
}
@end
