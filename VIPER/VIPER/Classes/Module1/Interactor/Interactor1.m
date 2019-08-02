//
//  Interactor1.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Interactor1.h"
#import "Entity1.h"
#import "Data.h"
#import "Store.h"

@interface Interactor1 ()

@end

@implementation Interactor1

@synthesize output = _output;

- (void)loadData
{
	if(_output && [_output respondsToSelector: @selector(dataDidLoad:)])
	{
		Entity1 *entity = [Store entity1FromPersistence];
		Data *data = [[Data alloc] init];
		data.imageName = entity.imageName;
		data.title = entity.title;
		data.desc = entity.desc;
		[_output dataDidLoad: data];
	}
}

@end
