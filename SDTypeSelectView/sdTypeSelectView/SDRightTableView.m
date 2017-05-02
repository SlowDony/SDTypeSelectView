//
//  SDRightTableView.m
//  SDTypeSelectView
//
//  Created by Megatron Joker on 2017/4/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDRightTableView.h"
#import "DuiGouTableViewCell.h"
@implementation SDRightTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//+(instancetype)tableViewWithFrame:(CGRect)frame delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate{
//    SDRightTableView *tableView = [[SDRightTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //    tableView.tag=101;
//    //    self.selectXiaLadataArray=mutableArr;
//    tableView.showsVerticalScrollIndicator = YES;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    
//    tableView.scrollEnabled=NO;
//    return tableView;
//    
//}

+(instancetype)tableViewWithFrame:(CGRect)frame{
    SDRightTableView *tableView = [[self alloc]initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.showsVerticalScrollIndicator = YES;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [tableView setDelegate:tableView];
    [tableView setDataSource:tableView];
    return tableView;
    
}

-(NSMutableDictionary *)selectedIndexes{
    if (!_selectedIndexes) {
        _selectedIndexes =[[NSMutableDictionary alloc]init];
    }
    return _selectedIndexes;
}

-(void)setRightArr:(NSMutableArray *)rightArr{
    _rightArr =rightArr;
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    [self reloadData];
}

#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.rightArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DuiGouTableViewCell *duiCell  =[DuiGouTableViewCell cellWithTableView:self];
    NSDictionary *dic =self.rightArr[indexPath.row];
    
    [duiCell setCellLabelHangHight:dic[@"title"]];
    [duiCell setModle:[self cellIsSelected:indexPath]];
    return duiCell;
}

- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {

    NSNumber *selectedIndex = [self.selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}
#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedIndexes removeAllObjects];
    
    self.selectIndexPath =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    
    NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
    [self.selectedIndexes setObject:selectedIndex forKey:indexPath];
    
    [self reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
