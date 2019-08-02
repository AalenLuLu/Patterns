//
//  Presenter2Protocol.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol View2Protocol;
@class Data;

@protocol Presenter2Protocol <NSObject>

@property (weak, nonatomic) id<View2Protocol> view;

- (void)loadData;
- (void)saveWithTitle: (NSString *)title desc: (NSString *)desc;

@end
