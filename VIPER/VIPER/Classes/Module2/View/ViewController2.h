//
//  ViewController2.h
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View2Protocol.h"

@protocol Presenter2Protocol;

@interface ViewController2 : UIViewController <View2Protocol>

- (instancetype)initWithPresenter: (id<Presenter2Protocol>)presenter;

@end
