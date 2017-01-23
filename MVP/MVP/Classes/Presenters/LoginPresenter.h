//
//  LoginPresenter.h
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CheckPresenter.h"

@interface LoginPresenter : NSObject

- (instancetype)initWithAccount: (NSString *)account password: (NSString *)password checkPresenter: (id<CheckPresenter>)checkPresenter;
- (void)loginWithCompletion: (void (^)(NSError *error))completion;

@end
