//
//  UserModel.h
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

- (instancetype)initWithAccount: (NSString *)account password: (NSString *)password;
- (void)loginWithError: (NSError **)error;

@end
