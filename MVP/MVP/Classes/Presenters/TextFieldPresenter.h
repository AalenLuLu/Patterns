//
//  TextFieldPresenter.h
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldPresenter <NSObject>

- (instancetype)initWithTextField: (UITextField *)textField;
- (BOOL)isValid;
- (NSString *)getResult;

@end
