//
//  DataModel.h
//  MVC
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataModelProtocol <NSObject>

- (void)didAddData: (NSArray *)newData;
- (void)didChangeData: (NSArray *)newData;

@end

@interface DataModel : NSObject

@property (weak, nonatomic) id<DataModelProtocol> delegate;

- (void)addData;
- (void)refreshData;

@end
