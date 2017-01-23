//
//  AccountPresenter.m
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AccountPresenter.h"

@implementation AccountPresenter

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
	//accountTextField.placeholder = @"0-9A-Za-z";
	if(0 == _textField.text.length)
	{
		return NO;
	}
	for(int i = 0;i < _textField.text.length;i++)
	{
		char c = [_textField.text characterAtIndex: i];
		if(!((48 <= c && 57 >= c) || (65 <= c && 90 >= c) || (97 <= c && 122 >= c)))
		{
			return NO;
		}
	}
	return YES;
}

- (NSString *)getResult
{
	if(0 == _textField.text.length)
	{
		return @"Please input valid account!";
	}
	return @"Account only can be 0-9A-Za-z!";
}

@end
