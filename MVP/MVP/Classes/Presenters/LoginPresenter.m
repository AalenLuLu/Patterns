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

@property (strong, nonatomic) id<CheckPresenter> checkPresenter;
@property (strong, nonatomic) UserModel *userModel;

@end

@implementation LoginPresenter

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password checkPresenter:(id<CheckPresenter>)checkPresenter
{
	if(self = [super init])
	{
		_checkPresenter = checkPresenter;
		_userModel = [[UserModel alloc] initWithAccount: account password: password];
	}
	return self;
}

- (void)loginWithCompletion:(void (^)(NSError *))completion
{
	if([_checkPresenter isValid])
	{
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			NSError *error = nil;
			[_userModel loginWithError: &error];
			if(completion)
			{
				completion(error);
			}
		});
	}
	else
	{
		NSString *result = [_checkPresenter getResult];
		if(completion)
		{
			NSError *error = [NSError errorWithDomain: @"com.aalen.demo.mvp.loginpresenter.domain" code: -1 userInfo: nil == result ? nil : @{@"result": result}];
			completion(error);
		}
	}
}

@end
