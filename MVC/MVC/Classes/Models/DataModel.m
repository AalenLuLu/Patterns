//
//  DataModel.m
//  MVC
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "DataModel.h"

static NSDateFormatter *formatter = nil;
static const int kCapacity = 5;

@interface DataModel ()

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
		_data = [[NSMutableArray alloc] initWithCapacity: kCapacity];
	}
	return self;
}

- (void)addData
{
	NSDate *now = [[NSDate alloc] init];
	NSMutableArray *newData = [[NSMutableArray alloc] initWithCapacity: kCapacity];
	for(int i = 0;i < kCapacity;i++)
	{
		[newData addObject: @{@"name": [[NSString alloc] initWithFormat: @"Name %lu", _data.count + i], @"time": [formatter stringFromDate: now]}];
	}
	[_data addObjectsFromArray: newData];
	if(_delegate && [_delegate respondsToSelector: @selector(didAddData:)])
	{
		[_delegate didAddData: newData];
	}
}

- (void)refreshData
{
	if(_delegate && [_delegate respondsToSelector: @selector(didChangeData:)])
	{
		[_delegate didChangeData: _data];
	}
}

@end
