//
//  UserModel.m
//  MVVM
//
//  Created by Aalen on 2017/2/3.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "UserModel.h"

@interface UserModel ()

@property (copy, nonatomic) NSString *account;
@property (copy, nonatomic) NSString *password;

@end

@implementation UserModel

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password
{
	if(self = [super init])
	{
		_account = account;
		_password = password;
	}
	return self;
}

- (void)loginWithError:(NSError **)error
{
	if(0 == random() % 3)
	{
		*error = [NSError errorWithDomain: @"com.aalen.demo.mvp.usermodel.domain" code: -1 userInfo: @{@"result": @"Random Failed!"}];
	}
}

- (NSString *)getInformation
{
	return [[NSString alloc] initWithFormat: @"%@\nsojvoijsovinsoinerwiunvkndbkjdfsnbodjfnboisnfbiovjsnfivjnsifjnv", _account];
}

@end
