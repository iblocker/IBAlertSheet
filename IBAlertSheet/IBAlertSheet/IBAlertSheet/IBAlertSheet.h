//
//  IBAlertSheet.h
//  IBAlertSheet
//
//  Created by iBlocker on 2017/12/6.
//  Copyright © 2017年 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^IBCompleteBlock)(NSString *selectString);
@interface IBAlertSheet : UIView
+ (instancetype)ib_showData:(NSArray *)dataSource completeBlock:(IBCompleteBlock)completeBlock;
@end
