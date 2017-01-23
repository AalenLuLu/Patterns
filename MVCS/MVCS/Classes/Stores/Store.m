//
//  Store.m
//  MVCS
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "Store.h"

static const int kCapacity = 5;

@interface Store ()

@property (strong, nonatomic) NSMutableArray *data;//应该从数据库或文件, demo用data...

@end

@implementation Store

- (instancetype)init
{
	if(self = [super init])
	{
		_data = [[NSMutableArray alloc] initWithCapacity: kCapacity];
	}
	return self;
}

- (NSArray *)getNewData
{
	NSDate *now = [[NSDate alloc] init];
	NSMutableArray *newData = [[NSMutableArray alloc] initWithCapacity: kCapacity];
	for(int i = 0;i < kCapacity;i++)
	{
		[newData addObject: @{@"name": [[NSString alloc] initWithFormat: @"Name %lu", _data.count + i], @"time": now}];
	}
	[_data addObjectsFromArray: newData];
	return newData;
}

- (NSArray *)getAllData
{
	return _data;
}

@end
