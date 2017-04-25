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
-(void)setUI{
    
        SDSelectView * selectView =[[SDSelectView alloc]initWithFrame:CGRectMake(0, 66+40, mDeviceWidth, mDeviceHeight) addDataArr:nil];
    
        self.selectView =selectView;

        [self.view addSubview:selectView];
        
    

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
