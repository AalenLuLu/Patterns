//
//  ViewController1.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1Protocol.h"

@protocol Presenter1Protocol;

@interface ViewController1 : UIViewController <View1Protocol>

- (instancetype)initWithPresenter: (id<Presenter1Protocol>)presenter;

@end
