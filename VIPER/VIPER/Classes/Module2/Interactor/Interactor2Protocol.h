//
//  Interactor2Protocol.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@protocol Interactor2Protocol <NSObject>

@property (copy, nonatomic) void (^dataDidLoadHandler)(Data *data);
@property (copy, nonatomic) void (^dataDidSaveHandler)(BOOL success);

- (void)loadData;
- (void)saveWithData: (Data *)data;

@end
