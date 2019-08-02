//
//  View2Protocol.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol View2Protocol <NSObject>

- (void)setViewTitle: (NSString *)title;
- (void)setViewDesc: (NSString *)desc;
- (void)showSaveResult: (NSString *)result;

@end
