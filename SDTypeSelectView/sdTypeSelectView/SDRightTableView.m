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
+(instancetype)tableViewWithFrame:(CGRect)frame delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate{
    SDRightTableView *tableView = [[SDRightTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tag=101;
    //    self.selectXiaLadataArray=mutableArr;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.scrollEnabled=NO;
    return tableView;
    
}

+(instancetype)tableViewWithFrame:(CGRect)frame{
    SDRightTableView *tableView =[self tableViewWithFrame:frame delegate:nil];
    [tableView setDelegate:tableView];
    [tableView setDataSource:tableView];
    return tableView;
    
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
    
    return duiCell;
}

//- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
//
//    NSNumber *selectedIndex = [self.selectedIndexes objectForKey:indexPath];
//    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
//}
#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
