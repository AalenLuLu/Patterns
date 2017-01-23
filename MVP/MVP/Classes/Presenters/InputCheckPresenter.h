//
//  InputCheckPresenter.h
//  MVP
//
//  Created by Aalen on 2017/1/23.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CheckPresenter.h"
#import "TextFieldPresenter.h"

@interface InputCheckPresenter : NSObject <CheckPresenter>

- (instancetype)initWithAccount: (id<TextFieldPresenter>)account password: (id<TextFieldPresenter>)password;

@end
