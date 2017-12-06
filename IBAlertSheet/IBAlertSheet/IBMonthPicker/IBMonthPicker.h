//
//  IBMonthPicker.h
//  IBAlertSheet
//
//  Created by iBlocker on 2017/12/6.
//  Copyright © 2017年 iBlocker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+JPExtention.h"

UIKIT_EXTERN NSString *__nonnull const kCFMonthPickerValueNotification;

@interface IBMonthPicker : UIView
/** 开始年份  Default is 2001*/
@property (nonatomic, assign) IBInspectable int startYear;
/** 结束年份 Default is current*/
@property (nonatomic, assign) IBInspectable int endYear;
@end
