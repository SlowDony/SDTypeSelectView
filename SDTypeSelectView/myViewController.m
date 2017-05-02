//
//  myViewController.m
//  SDTypeSelectView
//
//  Created by Megatron Joker on 2017/4/25.
//  Copyright © 2017年 slowdony. All rights reserved.
//

#import "myViewController.h"


#import "SDSelectView.h"
@interface myViewController ()
@property (nonatomic,strong)SDSelectView *selectView;
@end

@implementation myViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setUI];
}


-(SDSelectView *)selectView{
    if (!_selectView) {
        
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
        
        NSMutableArray *dataArr =[NSMutableArray arrayWithArray:arr];
        _selectView =[[SDSelectView alloc]initWithFrame:CGRectMake(0, 66+40, mDeviceWidth, mDeviceHeight) addDataArr:dataArr];
       
    }
    return _selectView;
}
-(void)setUI{
    //
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 66, mDeviceWidth, 40);
    label.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:label];
    
    [self.view addSubview:self.selectView];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
