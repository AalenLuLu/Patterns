//
//  DataModel.m
//  MVC
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "DataModel.h"
#import "Store.h"

static NSDateFormatter *formatter = nil;
static const int kCapacity = 5;

@interface DataModel ()

@property (strong, nonatomic) Store *store;
@property (strong, nonatomic) NSMutableArray<NSDictionary *> *data;

@end

@implementation DataModel

+ (void)initialize
{
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
}

- (instancetype)init
{
	if(self = [super init])
	{
		_store = [[Store alloc] init];
		_data = [[NSMutableArray alloc] initWithCapacity: kCapacity];
	}
	return self;
}

- (void)addData
{
	NSArray *newData = [_store getNewData];
	NSMutableArray *handledData = [[NSMutableArray alloc] initWithCapacity: newData.count];
	for(int i = 0;i < newData.count;i++)
	{
		NSDictionary *dic = newData[i];
		[handledData addObject: @{@"name": dic[@"name"], @"time": [formatter stringFromDate: dic[@"time"]]}];
	}
	[_data addObjectsFromArray: handledData];
	if(_delegate && [_delegate respondsToSelector: @selector(didAddData:)])
	{
		[_delegate didAddData: handledData];
	}
}

- (void)refreshData
{
	NSArray *allData = [_store getAllData];
	NSMutableArray *handledData = [[NSMutableArray alloc] initWithCapacity: allData.count];
	for(int i = 0;i < allData.count;i++)
	{
		NSDictionary *dic = allData[i];
		[handledData addObject: @{@"name": dic[@"name"], @"time": [formatter stringFromDate: dic[@"time"]]}];
	}
	self.data = handledData;
	if(_delegate && [_delegate respondsToSelector: @selector(didChangeData:)])
	{
		[_delegate didChangeData: _data];
	}
}

@end
