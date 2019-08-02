//
//  Store.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entity1;
@class Entity2;

@interface Store : NSObject

+ (Entity1 *)entity1FromPersistence;
+ (Entity2 *)entity2FromPersistence;
+ (void)saveTitle: (NSString *)title desc: (NSString *)desc completion: (void (^)(BOOL success))completion;

@end
