//
//  Presenter2.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Presenter2Protocol.h"

@protocol Interactor2Protocol;

@interface Presenter2 : NSObject <Presenter2Protocol>

- (instancetype)initWithInteractor: (id<Interactor2Protocol>)interactor;

@end
