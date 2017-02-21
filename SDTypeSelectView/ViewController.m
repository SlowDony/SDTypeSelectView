//
//  ViewController.m
//  SDTypeSelectView
//
//  Created by apple on 2016/12/31.
//  Copyright © 2016年 slowdony. All rights reserved.
//

#import "ViewController.h"
#import "SelectXialaView.h"

@interface ViewController ()<SelectXialaViewDelegate>
{
    SelectXialaView *selectV ;
    NSMutableArray *mutableArr;
    NSMutableArray *selectArr;
    NSMutableArray *selectLeftArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mutableArr =[[NSMutableArray alloc]initWithObjects:@"全程热门",@"附近",@"雁塔区",@"未央区",@"碑林区",@"莲湖区",nil];
    selectArr =[[NSMutableArray alloc]init];
    selectLeftArr =[[NSMutableArray alloc]init];
    NSIndexPath* rightSelectIndexPath =[NSIndexPath indexPathForRow:0 inSection:0];
    NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:selectedIndex forKey:rightSelectIndexPath];
    
    
    [selectArr removeAllObjects];
    for (int i=0;i<mutableArr.count ;i++){
        [selectArr addObject:dic];
    }
    [selectLeftArr removeAllObjects];
    
    [selectLeftArr addObject:rightSelectIndexPath];
    
    
    [self addNavView];
     [self setUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    //
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 65, mDeviceWidth, 40);
    [btn setTitle:@"筛选" forState:UIControlStateNormal];
    [btn setTitleColor:fontHightColor forState:UIControlStateNormal];
    [btn  addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 105, mDeviceWidth, 0.5);
    label.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}

-(void)btn{
    if(selectV==nil){
        selectV =[[SelectXialaView alloc]initWithFrame:CGRectMake(0, 66+40, mDeviceWidth, mDeviceHeight) addDataArr:mutableArr];
        selectV.delegate=self;
        
        NSIndexPath *index =(NSIndexPath *)selectLeftArr[0];
        [self rightTableAtIndexPath:index];
        
        selectV.selectedRightIndexes=[[NSMutableDictionary alloc]initWithDictionary:selectArr[index.row]];
        
        for(id key in selectV.selectedRightIndexes)
        {
            NSIndexPath *idxPath =(NSIndexPath *)key;
            [selectV.rightTableView scrollToRowAtIndexPath:idxPath
                                          atScrollPosition:UITableViewScrollPositionMiddle
                                                  animated:NO];
        }
        
        NSNumber *num =[NSNumber numberWithBool:YES];
        NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
        [dic setObject:num forKey:selectLeftArr[0]];
        selectV.selectedIndexes =[[NSMutableDictionary alloc]initWithDictionary:dic];
        
        DLog(@"selectLeftArr啊哈哈哈 :%@",selectLeftArr);
        
        [self.view addSubview:selectV];
        
    }

}


-(void)chongZhiData{
    
    
    NSIndexPath* rightSelectIndexPath =[NSIndexPath indexPathForRow:0 inSection:0];
    NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:selectedIndex forKey:rightSelectIndexPath];
    
    [selectArr removeAllObjects];
    for (int i=0;i<mutableArr.count ;i++){
        [selectArr addObject:dic];
    }
    
    [selectV.selectedRightIndexes removeAllObjects];
    selectV.selectedRightIndexes=[[NSMutableDictionary alloc]initWithDictionary:selectArr[0]];
    
    //    for(id key in selectV.selectedRightIndexes)
    //    {
    //        NSIndexPath *idxPath =(NSIndexPath *)key;
    //        [selectV.rightTableView scrollToRowAtIndexPath:idxPath
    //                                      atScrollPosition:UITableViewScrollPositionMiddle
    //                                              animated:NO];
    //    }
    [selectLeftArr removeAllObjects];
    
    [selectLeftArr addObject:rightSelectIndexPath];
    
    [selectV.selectedIndexes removeAllObjects];
    
    NSNumber *num =[NSNumber numberWithBool:YES];
    NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
    [dict setObject:num forKey:selectLeftArr[0]];
    selectV.selectedIndexes =[[NSMutableDictionary alloc]initWithDictionary:dict];
    
    [self rightTableAtIndexPath:rightSelectIndexPath];
    
    [selectV.rightTableView reloadData];
    [selectV.leftTableView reloadData];
    
    /*
    [selectRightIndexDic setValue:@"0"forKey:@"CusStatus"]; //客户状态
    [selectRightIndexDic setValue:@"0" forKey:@"CusClass"]; //客户分类
    [selectRightIndexDic setValue:@"-1" forKey:@"IsHot"]; //是否为热点客户
    [selectRightIndexDic setValue:@"" forKey:@"IntentionPro"]; //意向产品
    [selectRightIndexDic setValue:@"-1" forKey:@"ReportStatus"]; //报备状态
    [selectRightIndexDic setValue:@"0" forKey:@"BelongArea"]; //所属大区
    [selectRightIndexDic setValue:@"0" forKey:@"OwerUserId"]; //拥有人
    
    [selectRightIndexDic setValue:@"0" forKey:@"Order"]; // 排序方式
    
    [kehuTable.dataArray removeAllObjects];
    [kehuTable reloadData];
     */
    
}

#pragma mark - SelectXialaView(确定/重置按钮点击事件)Delegate
-(void)SelectXialaViewBtn:(UIButton *)sender{
    if(sender.tag==1001){
        DLog(@"重置按钮");
        
        [self chongZhiData ];
        
        
    }else {
        DLog(@"确定按钮");
        
        
       
        [selectV removeFromSuperview];
        selectV=nil;
       
        
        
    }
}

//左列表
-(void)SelectXialaLeftView:(UITableView *)leftTableView andRightTableView:(UITableView *)rightTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DLog(@"self.selectDIc :%@",selectV.selectedIndexes);
    
    //    NSIndexPath *rightIndexSelect =selectV.selectedIndexes[@"1"];
    //    DLog(@"rightIndexSelect section:%ld  and row %ld",indexPath.section,indexPath.row);
    
    
    DLog(@"selectArr:%@,selectArr数量:%ld",selectArr ,selectArr.count);
    
    //    DLog(@"selectV.selectedRightIndexes%@",selectV.selectedRightIndexes);
    
    
    // [selectV.selectedIndexes setValue:num forKey:indexPath.row];
    //    NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
    
    NSIndexPath *selectLeftIndex =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    
    [selectLeftArr replaceObjectAtIndex:0 withObject:selectLeftIndex];
    
    DLog(@"selectLeftArr:%@",selectLeftArr);
    [self rightTableAtIndexPath:indexPath];
    
    [selectV.selectedRightIndexes removeAllObjects];
    selectV.selectedRightIndexes=[[NSMutableDictionary alloc]initWithDictionary:selectArr[indexPath.row]];
    [rightTableView reloadData];
    
    for(id key in selectV.selectedRightIndexes)
    {
        NSIndexPath *idxPath =(NSIndexPath *)key;
        [selectV.rightTableView scrollToRowAtIndexPath:idxPath
                                      atScrollPosition:UITableViewScrollPositionMiddle
                                              animated:NO];
    }
    
    
    
    
    
}


-(void)rightTableAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: //全程热门
        {
            
            [selectV.selectRightArray removeAllObjects];
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"南大学城",@"小寨",@"回民街",@"钟楼",@"龙首村",@"电子城",@"阎良",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            
            //            [rightTableView reloadData];
            
        }
            break;
        case 1: //附近
        {
            
            
            [selectV.selectRightArray removeAllObjects];
            
            
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"500m",@"1km",@"3km", @"5km",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            
            /*
            typeMutabArr =[[NSMutableArray alloc]init];
            [typeMutabArr addObject:@"不限"];
            
            typeMutabArrID =[[NSMutableArray alloc]init];
            [typeMutabArrID addObject:@"0"];
            for (int i=0;i<typeArr.count;i++){
                
                [typeMutabArr addObject:typeArr[i][@"CustomerClassName"]];
                [typeMutabArrID addObject:typeArr[i][@"CustomerClassID"]];
            }
            
            [selectV.selectRightArray addObjectsFromArray:typeMutabArr];
            //            [rightTableView reloadData];
             */
        }
            break;
        case 2: //雁塔区
        {
            
            
            [selectV.selectRightArray removeAllObjects];
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"小寨",@"电子城",@"枫林绿洲",@"吉祥村",@"电视塔", @"大雁塔",@"科技路西口",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            //            [rightTableView reloadData];
        }
            break;
        case 3: //未央区
        {
            [selectV.selectRightArray removeAllObjects];
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"龙首村",@"未央路沿线",@"大明宫万达",@"赛高街区", @"三桥",@"北大明宫",@"北辰大道",@"北大学城",@"市图书馆",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            /*
            NSMutableArray *arr =[NSMutableArray array];
            
            [arr addObject:@"不限"];
            typeMutabArr =[[NSMutableArray alloc]init];
            
            for (int i=0;i<yixiangChanpinArr.count;i++){
             
                [arr addObject:yixiangChanpinArr[i][@"PName"]];
            }
            
            [selectV.selectRightArray addObjectsFromArray:arr];
            //            [rightTableView reloadData];
            */
        }
            break;
        case 4: //碑林区
        {
            [selectV.selectRightArray removeAllObjects];
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"南门",@"钟楼",@"长乐坊",@"李家村万达" ,@"南稍门",@"含光路",@"中贸广场",@"交大",@"东大街",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            //            [rightTableView reloadData];
        }
            break;
        case 5: //莲湖区
        {
            [selectV.selectRightArray removeAllObjects];
            NSArray *arr =[[NSArray alloc]initWithObjects:@"全部",@"回民街",@"钟楼",@"大寨路",@"西稍门", @"大兴新区",@"丰庆公园",@"北关正街",@"莲湖路",@"桃园路",nil];
            [selectV.selectRightArray addObjectsFromArray:arr];
            //            [rightTableView reloadData];
        }
            break;
        case 6: //拥有人
        {
            [selectV.selectRightArray removeAllObjects];
            
            /*
            xiashuArr =[[NSMutableArray alloc]init];
            [xiashuArr addObject:@"不限"];
            
            xiashuArrID =[[NSMutableArray alloc]init];
            [xiashuArrID addObject:@"-1"];
            for (int i=0;i<allXiashuArr.count;i++){
                
                [xiashuArr addObject:allXiashuArr[i][@"SName"]];
                [xiashuArrID addObject:allXiashuArr[i][@"SId"]];
            }
            
            [selectV.selectRightArray addObjectsFromArray:xiashuArr];
            */
            //            [rightTableView reloadData];
        }
            break;
        default:
            break;
            
    }
    
}
-(void)SelectXialaRightView:(UITableView *)rightTableView andLeftTableView:(UITableView *)leftTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath andLeftIndexPath:(NSIndexPath *)leftIndexPath{
    DLog(@"点击了左列表的第:%ld行,右列表的第%ld行",leftIndexPath.row,indexPath.row);
    
    [selectV.selectedRightIndexes removeAllObjects];
    
    
    NSNumber *selectedIndex = [NSNumber numberWithBool:YES];
    
    
    
    NSMutableDictionary *sd =[[NSMutableDictionary alloc]init];
    [sd setObject:selectedIndex forKey:indexPath];
    
    selectV.selectedRightIndexes =[[NSMutableDictionary alloc]initWithDictionary:sd];
    
    NSIndexPath *index =(NSIndexPath *)selectLeftArr[0];
    [selectArr replaceObjectAtIndex:index.row withObject:sd];
    
    //    [selectRightIndexDic setValue:@"0" forKey:@"CusClass"]; //客户分类
    //    [selectRightIndexDic setValue:@"-1" forKey:@"IsHot"]; //是否为热点客户
    //    [selectRightIndexDic setValue:@"" forKey:@"IntentionPro"]; //意向产品
    //    [selectRightIndexDic setValue:@"-1" forKey:@"ReportStatus"]; //报备状态
    //    [selectRightIndexDic setValue:@"0" forKey:@"BelongArea"]; //所属大区
    //    [selectRightIndexDic setValue:@"0" forKey:@"OwerUserId"]; //拥有人
    
    /*
    if (leftIndexPath.row==0){ //客户状态
        
        
        [selectRightIndexDic setValue:[NSString stringWithFormat:@"%ld",indexPath.row]forKey:@"CusStatus"]; //客户状态
         
        
    }
    else if(leftIndexPath.row==1){ //客户分类
        
        [selectRightIndexDic setValue:typeMutabArrID[indexPath.row] forKey:@"CusClass"]; //客户分类
        
    }
    else if(leftIndexPath.row==2){ //热点客户
        
        [selectRightIndexDic setValue:[NSString stringWithFormat:@"%ld",indexPath.row-1] forKey:@"IsHot"]; //是否为热点客户
        
    }
    else if(leftIndexPath.row==3){ //意向产品
        if ([selectV.selectRightArray[indexPath.row] isEqualToString:@"不限"]){
            [selectRightIndexDic setValue:@"" forKey:@"IntentionPro"]; //意向产品
            
        }else {
            [selectRightIndexDic setValue:selectV.selectRightArray[indexPath.row] forKey:@"IntentionPro"];
        }
        
        
    }
    else if(leftIndexPath.row==4){ //报备状态
        [selectRightIndexDic setValue:[NSString stringWithFormat:@"%ld",indexPath.row-1] forKey:@"ReportStatus"]; //报备状态
        
    }
    else if(leftIndexPath.row==5){ //所属大区
        
        
        if ([selectV.selectRightArray[indexPath.row] isEqualToString:@"不限"]){
            
            [selectRightIndexDic setValue:@"0" forKey:@"BelongArea"]; //所属大区
            
        }else {
            
            [selectRightIndexDic setValue:[NSString stringWithFormat:@"%ld",indexPath.row+37] forKey:@"BelongArea"]; //所属大区
        }
        
    }
    else if(leftIndexPath.row==6){ //拥有人
        
        [selectRightIndexDic setValue:xiashuArrID[indexPath.row] forKey:@"OwerUserId"]; //拥有人
        
    }
     */
    
    
}


-(void)addNavView{
    
    UIView *navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0,mDeviceWidth,64);
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    //
    UILabel *navTitle = [[UILabel alloc] init];
    navTitle.frame = CGRectMake(0, 20, mDeviceWidth, 64-20);
    navTitle.backgroundColor = [UIColor clearColor];
    navTitle.textColor = [UIColor blackColor];
    navTitle.text = @"筛选控件";
    
    navTitle.textAlignment = NSTextAlignmentCenter;
    navTitle.font = [UIFont systemFontOfSize:20];
    navTitle.numberOfLines = 0;
    [navView addSubview:navTitle];
    //
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 64, mDeviceWidth, 0.5);
    label.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:label];
}

@end
