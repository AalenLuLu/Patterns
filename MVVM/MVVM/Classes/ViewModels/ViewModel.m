//
//  ViewModel.m
//  MVVM
//
//  Created by Aalen on 2017/2/3.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewModel.h"

#import "UserModel.h"

NSString * const kLoginStateChangedNotification = @"com.aalen.demo.patterns.mvvm.login.statechange.notification";
NSString * const kLoginErrorNotification = @"com.aalen.demo.patterns.mvvm.login.error.notification";

@interface ViewModel ()

@property (strong, nonatomic) UserModel *userModel;

@end

@implementation ViewModel

- (instancetype)init
{
	if(self = [super init])
	{
		
	}
	return self;
}

- (void)loginWithAccount:(NSString *)account password:(NSString *)password
{
	if(![self isAccountValid: account])
	{
		[[NSNotificationCenter defaultCenter] postNotificationName: kLoginErrorNotification object: nil userInfo: @{@"result": [self getAccountResult: account]}];
	}
	else if(![self isPasswordValid: password])
	{
		[[NSNotificationCenter defaultCenter] postNotificationName: kLoginErrorNotification object: nil userInfo: @{@"result": [self getPasswordResult: password]}];
	}
	else
	{
		_userModel = [[UserModel alloc] initWithAccount: account password: password];
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSError *error = nil;
			[_userModel loginWithError: &error];
			if(error)
			{
				[[NSNotificationCenter defaultCenter] postNotificationName: kLoginErrorNotification object: nil userInfo: error.userInfo];
			}
			else
			{
				_online = YES;
				[[NSNotificationCenter defaultCenter] postNotificationName: kLoginStateChangedNotification object: nil userInfo: nil];
			}
		});
	}
}

- (void)logout
{
	self.userModel = nil;
	_online = NO;
	[[NSNotificationCenter defaultCenter] postNotificationName: kLoginStateChangedNotification object: nil userInfo: nil];
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

- (NSString *)getInformation
{
	return [_userModel getInformation];
}

@end
