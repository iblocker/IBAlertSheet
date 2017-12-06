//
//  ViewController.m
//  IBAlertSheet
//
//  Created by iBlocker on 2017/12/6.
//  Copyright © 2017年 iBlocker. All rights reserved.
//

#import "ViewController.h"
#import "IBAlertSheet.h"
#import "IBMonthPicker.h"

@interface ViewController ()
@property (nonatomic, strong) IBMonthPicker *monthPicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.monthPicker];
}

- (IBAction)popUp:(UIButton *)sender {
    [IBAlertSheet ib_showData:@[@"1", @"2", @"3", @"4"] completeBlock:^(NSString *selectString) {
        NSLog(@"%@", selectString);
    }];
}

- (IBMonthPicker *)monthPicker {
    if (!_monthPicker) {
        _monthPicker = [[IBMonthPicker alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(UIScreen.mainScreen.bounds), 216)];
    }
    return _monthPicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
