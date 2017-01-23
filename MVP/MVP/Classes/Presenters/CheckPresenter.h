//
//  CheckPresenter.h
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CheckPresenter <NSObject>

- (BOOL)isValid;
- (NSString *)getResult;

@end
