//
//  Interactor2.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Interactor2.h"
#import "Store.h"
#import "Entity2.h"
#import "Data.h"

@implementation Interactor2

@synthesize dataDidLoadHandler = _dataDidLoadHandler;
@synthesize dataDidSaveHandler = _dataDidSaveHandler;

- (void)loadData
{
	Entity2 *entity = [Store entity2FromPersistence];
	Data *data = [[Data alloc] init];
	data.title = entity.title;
	data.desc = entity.desc;
	if(_dataDidLoadHandler)
	{
		_dataDidLoadHandler(data);
	}
}

- (void)saveWithData:(Data *)data
{
	Entity2 *entity = [[Entity2 alloc] init];
	entity.title = data.title;
	entity.desc = data.desc;
	[Store saveTitle: entity.title desc: entity.desc completion:^(BOOL success) {
		if(self.dataDidSaveHandler)
		{
			self.dataDidSaveHandler(success);
		}
	}];
}

@end
