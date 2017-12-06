//
//  ViewController.m
//  IBAlertSheet
//
//  Created by iBlocker on 2017/12/6.
//  Copyright © 2017年 iBlocker. All rights reserved.
//

#import "ViewController.h"
#import "IBAlertSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)popUp:(UIButton *)sender {
    [IBAlertSheet ib_showData:@[@"1", @"2", @"3", @"4"] completeBlock:^(NSString *selectString) {
        NSLog(@"%@", selectString);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
