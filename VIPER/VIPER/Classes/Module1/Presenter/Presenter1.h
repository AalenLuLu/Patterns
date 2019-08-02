//
//  Presenter1.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Presenter1Protocol.h"
#import "Interactor1Protocol.h"

@interface Presenter1 : NSObject <Presenter1Protocol, Interactor1Output>

- (instancetype)initWithInteractor: (id<Interactor1Input>)interactor;

@end
