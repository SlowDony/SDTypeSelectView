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
        
        NSArray *arr =@[@{@"title":@"全程热门",@"value":@"0"},
                        @{@"title":@"附近",@"value":@"1"},
                        @{@"title":@"雁塔区",@"value":@"2"},
                        @{@"title":@"未央区",@"value":@"3"},
                        @{@"title":@"碑林区",@"value":@"4"},
                        @{@"title":@"莲湖区",@"value":@"5"},
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
    duiCell.cellLabel.text=dic[@"title"];
    
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
    
    self.leftArrDidSelectHandler(self.leftArr[indexPath.row]);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
