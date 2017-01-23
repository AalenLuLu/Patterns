//
//  InputCheckPresenter.m
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "InputCheckPresenter.h"

@interface InputCheckPresenter ()

@property (strong, nonatomic) id<TextFieldPresenter> account;
@property (strong, nonatomic) id<TextFieldPresenter> password;

@end

@implementation InputCheckPresenter

- (instancetype)initWithAccount:(id<TextFieldPresenter>)account password:(id<TextFieldPresenter>)password
{
	if(self = [super init])
	{
		_account = account;
		_password = password;
	}
	return self;
}

- (BOOL)isValid
{
	if([_account isValid] && [_password isValid])
	{
		return YES;
	}
	return NO;
}

- (NSString *)getResult
{
	NSString *result = nil;
	if(![_account isValid])
	{
		result = [_account getResult];
	}
	else if(![_password isValid])
	{
		result = [_password getResult];
	}
	else
	{
		result = @"Success!";
	}
	return result;
}

@end
