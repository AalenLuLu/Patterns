//
//  LoginPresenterProtocol.h
//  MVP
//
//  Created by Aalen on 2017/1/24.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginViewProtocol.h"

@protocol LoginPresenterProtocol <NSObject>

- (instancetype)initWithView: (id<LoginViewProtocol>)view;
- (void)loginWithAccount: (NSString *)account password: (NSString *)password;

@end
