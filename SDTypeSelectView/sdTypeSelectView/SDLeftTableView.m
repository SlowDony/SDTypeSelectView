//
//  SDLeftTableView.m
//  SDTypeSelectView
//
//  Created by Megatron Joker on 2017/4/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "SDLeftTableView.h"

#import "DuiGouTableViewCell.h"
@implementation SDLeftTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)tableViewWithFrame:(CGRect)frame delegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate{
    SDLeftTableView *tableView = [[SDLeftTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
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
    SDLeftTableView *tableView =[self tableViewWithFrame:frame delegate:nil];
    [tableView setDelegate:tableView];
    [tableView setDataSource:tableView];
    return tableView;

}

-(NSMutableArray *)leftArr{
    if(!_leftArr){
        
        NSArray *arr =@[@{@"headTitle":@"病历概览",@"data":@[@{@"num":@"2",@"title":@"病历录入"},
                                                         @{@"num":@"1",@"title":@"当日预约"},
                                                         @{@"num":@"1",@"title":@"预约到日"},
                                                         @{@"num":@"1",@"title":@"当日到诊"},
                                                         @{@"num":@"1",@"title":@"预约未到诊"}
                                                         ]},
                        @{@"headTitle":@"渠道概览",@"data":@[@{@"num":@"2",@"title":@"咨询次数"},
                                                         @{@"num":@"22",@"title":@"有效对话"},
                                                         @{@"num":@"4",@"title":@"最佳对话"},
                                                         @{@"num":@"1",@"title":@"优质对话"},
                                                         @{@"num":@"1",@"title":@"一般对话"},
                                                         @{@"num":@"1",@"title":@"主动邀请"}
                                                         
                                                         ]},
                        @{@"headTitle":@"回访处理",@"data":@[@{@"num":@"3",@"title":@"今日已访"},
                                                         @{@"num":@"2",@"title":@"当日需访"},
                                                         @{@"num":@"22",@"title":@"逾期未回访"}
                                                         ]},
                        
                        @{@"headTitle":@"回访处理",@"data":@[@{@"num":@"3",@"title":@"今日已访"},
                                                         @{@"num":@"2",@"title":@"当日需访"},
                                                         @{@"num":@"22",@"title":@"逾期未回访"}
                                                         ]},
                        @{@"headTitle":@"留言处理",@"data":@[@{@"num":@"24",@"title":@"留言"},
                                                         @{@"num":@"3",@"title":@"未处理留言"}
                                                         ]},
                        ];
        
        _leftArr =[[NSMutableArray alloc]initWithArray:arr];
        
    }
    return _leftArr;
}
#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.leftArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DuiGouTableViewCell *duiCell  =[DuiGouTableViewCell cellWithTableView:self];
    NSDictionary *dic =self.leftArr[indexPath.row];
    duiCell.cellLabel.text=dic[@"headTitle"];
    
//    [duiCell setNoDuiGouModle:[self cellIsSelected:indexPath]];
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
    NSArray *arr =self.leftArr[indexPath.row][@"data"];
    
    self.leftArrDidSelectHandler(arr);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
