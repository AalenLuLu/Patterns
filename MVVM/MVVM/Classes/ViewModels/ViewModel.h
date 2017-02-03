//
//  ViewModel.h
//  MVVM
//
//  Created by Aalen on 2017/2/3.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLoginStateChangedNotification;
extern NSString * const kLoginErrorNotification;

@interface ViewModel : NSObject

@property (assign, nonatomic) BOOL online;

- (void)loginWithAccount: (NSString *)account password: (NSString *)password;
- (void)logout;
- (NSString *)getInformation;

@end
