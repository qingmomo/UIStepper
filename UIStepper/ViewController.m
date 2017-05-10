//
//  ViewController.m
//  UIStepper
//
//  Created by 黎仕仪 on 17/5/8.
//  Copyright © 2017年 shiyi.Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIStepper *stepper1;
    UILabel *label1;
    
    UIStepper *stepper;
    UILabel *label;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createStepper1];  //对比版
    
    [self createStepper];   //完成版

    
    
}

#pragma mark - 对比版
- (void)createStepper1{
    stepper1 = [[UIStepper alloc]initWithFrame:CGRectMake(100, 100, 8, 5)];
    stepper1.tintColor = [UIColor lightGrayColor];
    stepper1.minimumValue = 0;
    stepper1.maximumValue = 100;
    stepper1.stepValue = 1;
    [stepper1 addTarget:self action:@selector(valuechange1) forControlEvents:UIControlEventValueChanged];
    //    step.wraps = YES;  //写了这个属性从0递减是100，从100递增是0
    [self.view addSubview:stepper1];
    
    [stepper1 setDecrementImage:[UIImage imageNamed:@"减号"] forState:UIControlStateNormal];
    [stepper1 setIncrementImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(127, 101, 36, 27)];
    label1.backgroundColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"0";
    [self.view addSubview:label1];
}

- (void)valuechange1{
    label1.text = [NSString stringWithFormat:@"%d",(int)stepper1.value];
}


#pragma mark - 正常
-(void)createStepper{
    stepper = [[UIStepper alloc]initWithFrame:CGRectMake(100, 200, 8, 5)];
    stepper.tintColor = [UIColor clearColor];
    stepper.minimumValue = 0;
    stepper.maximumValue = 1000;
    stepper.stepValue = 1;
    [stepper addTarget:self action:@selector(valuechange) forControlEvents:UIControlEventValueChanged];
    //    step.wraps = YES;  //写了这个属性从0递减是100，从100递增是0
    [self.view addSubview:stepper];
    
    UIImageView *decrementImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 29, 29)];
    decrementImgView.image = [UIImage imageNamed:@"reduce"];
    [stepper addSubview:decrementImgView];
    
    UIImageView *incrementImgView = [[UIImageView alloc]initWithFrame:CGRectMake(65, 0, 29, 29)];
    incrementImgView.image = [UIImage imageNamed:@"plus"];
    [stepper addSubview:incrementImgView];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(129, 201, 36, 27)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"0";
    [self.view addSubview:label];
    
}


- (void)valuechange{
    label.text = [NSString stringWithFormat:@"%d",(int)stepper.value];
}


@end
