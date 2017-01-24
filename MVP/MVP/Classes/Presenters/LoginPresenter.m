//
//  LoginPresenter.m
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "LoginPresenter.h"

#import "UserModel.h"

@interface LoginPresenter ()

@property (strong, nonatomic) UserModel *userModel;
@property (weak, nonatomic) id<LoginViewProtocol> view;

@end

@implementation LoginPresenter

- (instancetype)initWithView:(id<LoginViewProtocol>)view
{
	if(self = [super init])
	{
		_view = view;
	}
	return self;
}

- (void)loginWithAccount:(NSString *)account password:(NSString *)password
{
	if(![self isAccountValid: account])
	{
		[_view showResult: [self getAccountResult: account]];
	}
	else if(![self isPasswordValid: password])
	{
		[_view showResult: [self getPasswordResult: password]];
	}
	else
	{
		_userModel = [[UserModel alloc] initWithAccount: account password: password];
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSError *error = nil;
			[_userModel loginWithError: &error];
			if(error)
			{
				[_view showResult: error.userInfo[@"result"]];
			}
			else
			{
				[_view showResult: @"Success!"];
			}
		});
	}
}

- (BOOL)isAccountValid: (NSString *)account
{
	//accountTextField.placeholder = @"0-9A-Za-z";
	if(0 == account.length)
	{
		return NO;
	}
	for(int i = 0;i < account.length;i++)
	{
		char c = [account characterAtIndex: i];
		if(!((48 <= c && 57 >= c) || (65 <= c && 90 >= c) || (97 <= c && 122 >= c)))
		{
			return NO;
		}
	}
	return YES;
}

- (NSString *)getAccountResult: (NSString *)account
{
	if(0 == account.length)
	{
		return @"Please input valid account!";
	}
	return @"Account only can be 0-9A-Za-z!";
}

- (BOOL)isPasswordValid: (NSString *)password
{
	//passwordTextField.placeholder = @"more than 6";
	if(0 < password.length && 6 <= password.length)
	{
		return YES;
	}
	return NO;
}

- (NSString *)getPasswordResult: (NSString *)password
{
	if(0 == password.length)
	{
		return @"Please input valid password!";
	}
	return @"Password must more than 6 character!";
}

@end
