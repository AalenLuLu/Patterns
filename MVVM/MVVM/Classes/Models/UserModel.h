//
//  UserModel.h
//  MVVM
//
//  Created by Aalen on 2017/2/3.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

- (instancetype)initWithAccount: (NSString *)account password: (NSString *)password;
- (void)loginWithError: (NSError **)error;
- (NSString *)getInformation;

@end
