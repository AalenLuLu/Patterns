//
//  Interactor1Protocol.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@protocol Interactor1Output <NSObject>

- (void)dataDidLoad: (Data *)data;

@end

@protocol Interactor1Input <NSObject>

@property (weak, nonatomic) id<Interactor1Output> output;

- (void)loadData;

@end
