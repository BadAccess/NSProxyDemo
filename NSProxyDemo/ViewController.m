//
//  ViewController.m
//  NSProxyDemo
//
//  Created by ZhengWei on 2017/6/19.
//  Copyright © 2017年 ZhengWei. All rights reserved.
//

#import "ViewController.h"
#import "ServiceProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ServiceProxy *proxy = [ServiceProxy shareProxy];
    [proxy getProductInfo:@"123456"];
    [proxy submitOrder:@"程序员标配的横条纹T"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
