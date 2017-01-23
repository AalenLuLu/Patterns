//
//  PasswordPresenter.m
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "PasswordPresenter.h"

@implementation PasswordPresenter

- (instancetype)initWithTextField:(UITextField *)textField
{
	if(self = [super init])
	{
		_textField = textField;
	}
	return self;
}

- (BOOL)isValid
{
	//passwordTextField.placeholder = @"more than 6";
	if(0 < _textField.text.length && 6 <= _textField.text.length)
	{
		return YES;
	}
	return NO;
}

- (NSString *)getResult
{
	if(0 == _textField.text.length)
	{
		return @"Please input valid password!";
	}
	return @"Password must more than 6 character!";
}

@end
