//
//  IBAlertSheet.m
//  IBAlertSheet
//
//  Created by iBlocker on 2017/12/6.
//  Copyright © 2017年 iBlocker. All rights reserved.
//

#import "IBAlertSheet.h"

@interface IBAlertSheet () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UIWindow *window;
@property (nonatomic, strong) UIView *selectView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) IBCompleteBlock completeBlock;
@end
static CGFloat alertSheetHeight = 180;
@implementation IBAlertSheet

+ (instancetype)ib_showData:(NSArray *)dataSource completeBlock:(IBCompleteBlock)completeBlock {
    
    IBAlertSheet *alertSheet = [[IBAlertSheet alloc] init];
    alertSheet.dataSource = dataSource;
    alertSheet.completeBlock = completeBlock;
    [alertSheet ib_show];
    return alertSheet;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
        self.frame = self.window.bounds;
        
        self.selectView = ({
            UIView *selectView  = [[UIView alloc] init];
            selectView.backgroundColor = [UIColor whiteColor];
            selectView.frame = CGRectMake(0, self.frame.size.height - alertSheetHeight, self.frame.size.width, alertSheetHeight);
            selectView.backgroundColor = [UIColor whiteColor];
            selectView;
        });
        [self addSubview:_selectView];
        [self.selectView addSubview:({
            
            //左侧取消按钮
            UIButton *btn1 = [[UIButton alloc] init];
            btn1.frame = CGRectMake(0, 0, 50, 40);
            [btn1 setTitle:@"取消" forState:UIControlStateNormal];
            [btn1 setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
            [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn1;
        })];
        [self.selectView addSubview:({
            
            UITableView *ctntView = [[UITableView alloc] initWithFrame:(CGRect){0, 50, self.frame.size.width, alertSheetHeight - 60} style:UITableViewStylePlain];
            ctntView.dataSource = self;
            ctntView.delegate = self;
            ctntView.separatorColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.3];
            ctntView;
        })];
    }
    return self;
}

#pragma mark - Methods
- (void)ib_show {
    [self.window addSubview:self];
    self.selectView.frame = [self hideSelectViewFrame];
    [UIView animateWithDuration:0.25 animations:^{
        self.selectView.frame = [self showSelectViewFrame];
    } completion:^(BOOL finished) {
        self.selectView.frame = [self showSelectViewFrame];
    }];
}

- (void)ib_hidden {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.selectView.frame = [self hideSelectViewFrame];
    } completion:^(BOOL finished) {
        self.selectView.frame = [self hideSelectViewFrame];
        [self removeFromSuperview];
    }];
}

- (CGRect)showSelectViewFrame {
    return CGRectMake(0, CGRectGetHeight(self.frame) - alertSheetHeight, CGRectGetWidth(self.frame), alertSheetHeight);
}

- (CGRect)hideSelectViewFrame {
    return CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), alertSheetHeight);
}

#pragma mark - Action
- (void)btnAction:(UIButton *)btn {
    [self ib_hidden];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    if (touch.view != self.paywayView) {
//        [self ib_hidden];
//    }
//}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellReuseIdentifier"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = UIColor.blackColor;
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.completeBlock) {
        self.completeBlock(cell.textLabel.text);
    }
    [self ib_hidden];
}

#pragma mark - Private
// 获取当前处于activity状态的Window
- (UIWindow *)window {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows) {
            if(tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

@end
