//
//  Presenter1Protocol.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol View1Protocol;

@protocol Presenter1Protocol <NSObject>

@property (weak, nonatomic) id<View1Protocol> view;

- (void)loadData;
- (void)viewDidClickEdit;

@end
