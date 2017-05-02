//
//  SDLeftTableView.h
//  SDTypeSelectView
//
//  Created by Megatron Joker on 2017/4/19.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SDLeftTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

/**
 tableview构造器

 @param frame tableviewframe
 @param delegate 代理
 @return tableview
 */
+(instancetype)tableViewWithFrame:(CGRect )frame delegate:(id<UITableViewDelegate,UITableViewDataSource>) delegate;
+(instancetype)tableViewWithFrame:(CGRect )frame ;

@property (nonatomic,strong)NSMutableArray *leftArr; //数据源
@property (nonatomic,strong)NSMutableDictionary *selectedIndexes;
@property (nonatomic,strong)NSIndexPath *selectIndexPath;

@property (nonatomic,copy)void(^leftArrDidSelectHandler)(NSArray *arr);

@end
