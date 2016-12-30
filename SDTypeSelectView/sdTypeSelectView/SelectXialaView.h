//
//  SelectXialaView.h
//  tcrj_tcyun
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectXialaViewDelegate <NSObject>

-(void)SelectXialaViewBtn:(UIButton *)sender;
//左列表的点击事件
-(void)SelectXialaLeftView:(UITableView *)leftTableView andRightTableView:(UITableView *)rightTableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

//右列表的点击事件
-(void)SelectXialaRightView:(UITableView *)rightTableView
           andLeftTableView:(UITableView *)leftTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath andLeftIndexPath:(NSIndexPath *)leftIndexPath;



@end
@interface SelectXialaView : UIView

@property (nonatomic,assign)id<SelectXialaViewDelegate>delegate;
-(id)initWithFrame:(CGRect)frame addDataArr:(NSMutableArray *)mutableArr;

@property (nonatomic,strong)NSMutableArray *selectXiaLadataArray;
@property (nonatomic,strong)NSMutableArray *selectRightArray;
@property (nonatomic,strong)NSMutableDictionary *selectedIndexes;
@property (nonatomic,strong)NSMutableDictionary *selectedRightIndexes;

@property (nonatomic,strong)UITableView *leftTableView;
@property (nonatomic,strong)UITableView *rightTableView;

@property (nonatomic,strong)NSMutableArray *selctArr;

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath;
-(void)loadSels;
-(void)savaSels;
@end
