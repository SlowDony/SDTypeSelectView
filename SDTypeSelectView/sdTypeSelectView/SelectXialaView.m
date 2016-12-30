//
//  SelectXialaView.m
//  tcrj_tcyun
//
//  Created by apple on 16/4/5.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "SelectXialaView.h"
#import "DuiGouTableViewCell.h"
#import "BigDuiGouTableViewCell.h"
@interface SelectXialaView () <UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *selectIndexPath;
    NSIndexPath *selectRightIndexPath;
    BOOL isboolShow;
   
    NSInteger index;
}

@end


@implementation SelectXialaView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize leftTableView;
@synthesize rightTableView;
-(id)initWithFrame:(CGRect)frame addDataArr:(NSMutableArray *)mutableArr{
    
    
    self =[super initWithFrame:frame];
    if (self){
        isboolShow=NO;
        
        self.selectRightArray =[NSMutableArray array];
        self.selctArr =[NSMutableArray array];
          self.selectedIndexes =[[NSMutableDictionary alloc]init];
        self.selectedRightIndexes =[[NSMutableDictionary alloc]init];
        self.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.5];
        self.userInteractionEnabled=YES;
        //
        UIView *bjView =[[UIView alloc]init];
        bjView.backgroundColor=mHexRGB(0xe4e4e4);
        
        
        bjView.frame=CGRectMake(0, 0, self.frame.size.width, 0);
        [self addSubview:bjView];
      
        
        leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width/2, 0) style:UITableViewStylePlain];
        leftTableView.delegate = self;
        leftTableView.dataSource = self;
        leftTableView.tag=101;
        self.selectXiaLadataArray=mutableArr;
        leftTableView.showsVerticalScrollIndicator = YES;
        leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        leftTableView.backgroundColor = [UIColor redColor];
        leftTableView.scrollEnabled=NO;
        [bjView addSubview:leftTableView];
        
        rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0,self.frame.size.width/2, 0) style:UITableViewStylePlain];
        rightTableView.delegate = self;
        rightTableView.dataSource = self;
        rightTableView.tag=102;
        rightTableView.showsVerticalScrollIndicator = YES;
                rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        rightTableView.backgroundColor = [UIColor whiteColor];
        
//       [rightTableView selectRowAtIndexPath:[NSIndexPath indexPathWithIndex:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        [bjView addSubview:rightTableView];
        
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
            leftTableView.frame=CGRectMake(0, 0, self.frame.size.width/2, mutableArr.count*35);
            rightTableView.frame=CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, mutableArr.count*35);
            bjView.frame=CGRectMake(0, 0, self.frame.size.width, mutableArr.count*35+40);
            
            chongZhiBtn.frame = CGRectMake(self.frame.size.width-120,bjView.frame.size.height-40,40, 40);
             sureBtn.frame = CGRectMake(self.frame.size.width-60, bjView.frame.size.height-40, 40, 40);
//            bjView.alpha=1;
//            leftTableView.alpha=1;
            
        } completion:nil];
        
        
    }
    return self;
}


-(void)chongzhiClicked:(UIButton *)sender{
//    DLog(@"chongzhi");
    if([self.delegate respondsToSelector:@selector(SelectXialaViewBtn:)]){
        [self.delegate SelectXialaViewBtn:sender];
    }
    switch (sender.tag) {
        case 1002:
        {
//            [self savaSels];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)savaSels{
    
    index =leftTableView.indexPathForSelectedRow.row;
    
}


//加载保存
-(void)loadSels
{
    
}




#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return  [<#parameter#> count];
    if (tableView ==leftTableView)
    {
        return self.selectXiaLadataArray.count;
    }
    else
    {
        return self.selectRightArray.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellId = @"sCellID";
//    BigDuiGouTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if (cell == nil) {
//        cell =[[BigDuiGouTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//    }
    
    static NSString *duiHaoCellId = @"duiHaoCellId";
    DuiGouTableViewCell *duiCell = [tableView dequeueReusableCellWithIdentifier:duiHaoCellId];
    if (duiCell == nil) {
        duiCell =[[DuiGouTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:duiHaoCellId];
    }
    //配置数据
    if (tableView.tag==101) {
        
        
        duiCell.cellLabel.text=self.selectXiaLadataArray[indexPath.row];
        
        [duiCell setNoDuiGouModle:[self cellIsSelected:indexPath]];
        
        
        return duiCell;
        
        
    }
    else
    {
//        duiCell.cellLabel.text=self.selectRightArray[indexPath.row];
        
        [duiCell setCellLabelHangHight:self.selectRightArray[indexPath.row]];
//        duiCell.cellLabel.backgroundColor=[UIColor redColor];
        [duiCell setModle:[self cellIsRightSelected:indexPath]];
        return duiCell;
    }
}

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
    
    NSNumber *selectedIndex = [self.selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}

- (BOOL)cellIsRightSelected:(NSIndexPath *)indexPath {
    
    

    NSNumber *selectedIndex = [self.selectedRightIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}

#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == leftTableView){
        [self.selectedIndexes removeAllObjects];
        
        selectIndexPath =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        
        NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
        
        
        [self.selectedIndexes setObject:selectedIndex forKey:indexPath];
        
        [leftTableView reloadData];
        
        if ([self.delegate respondsToSelector:@selector(SelectXialaLeftView:andRightTableView:didSelectRowAtIndexPath:)]){
            [self.delegate SelectXialaLeftView:leftTableView andRightTableView:rightTableView didSelectRowAtIndexPath:indexPath];
        }
    }else {
    
        [self.selectedRightIndexes removeAllObjects];
       
        selectRightIndexPath =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    
        NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
        [self.selectedRightIndexes setObject:selectedIndex forKey:indexPath];
        
        [rightTableView reloadData];
        
//        if ([self.delegate respondsToSelector:@selector(SelectXialaLeftView:andRightTableView:didSelectRowAtIndexPath:)]){
//            [self.delegate SelectXialaRightView:rightTableView andLeftTableView:leftTableView didSelectRowAtIndexPath:indexPath];
//        }
        
        if ([self.delegate respondsToSelector:@selector(SelectXialaRightView:andLeftTableView:didSelectRowAtIndexPath:andLeftIndexPath:)]) {
            [self.delegate SelectXialaRightView:rightTableView  andLeftTableView:leftTableView didSelectRowAtIndexPath:indexPath andLeftIndexPath:selectIndexPath];
        }
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==leftTableView) {
        return 35;
    }else if(tableView==rightTableView){
        
        DuiGouTableViewCell *cell =(DuiGouTableViewCell*)[self tableView:rightTableView cellForRowAtIndexPath:indexPath];
//              DLog(@"height%ld",cell.frame.size.height);
        return cell.frame.size.height;
        
    }else {
        return  35;
    }
    
}

@end
