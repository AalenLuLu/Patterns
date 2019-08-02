//
//  Store.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Store.h"
#import "Entity1.h"
#import "Entity2.h"

static NSString *kTitleKey = @"VIPER_TITLE";
static NSString *kDescKey = @"VIPER_DESCRIPTION";

@implementation Store

+ (Entity1 *)entity1FromPersistence
{
	Entity1 *entity = [[Entity1 alloc] init];
	entity.imageName = @"image";
	entity.title = [[NSUserDefaults standardUserDefaults] stringForKey: kTitleKey] ? : @"Default Title";
	entity.desc = [[NSUserDefaults standardUserDefaults] stringForKey: kDescKey] ? : @"Default Description...";
	return entity;
}

+ (Entity2 *)entity2FromPersistence
{
	Entity2 *entity = [[Entity2 alloc] init];
	entity.title = [[NSUserDefaults standardUserDefaults] stringForKey: kTitleKey] ? : @"Default Title";
	entity.desc = [[NSUserDefaults standardUserDefaults] stringForKey: kDescKey] ? : @"Default Description...";
	return entity;
}

+ (void)saveTitle:(NSString *)title desc:(NSString *)desc completion:(void (^)(BOOL))completion
{
	[[NSUserDefaults standardUserDefaults] setObject: title forKey: kTitleKey];
	[[NSUserDefaults standardUserDefaults] setObject: desc forKey: kDescKey];
	if(completion)
	{
		completion(YES);
	}
}

@end
