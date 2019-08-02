//
//  Router2.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Router2.h"
#import "ViewController2.h"
#import "Interactor2.h"
#import "Presenter2.h"


@implementation Router2

+ (void)navigateToView
{
	[((UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController) pushViewController: [self _buildView] animated: YES];
}

+ (ViewController2 *)_buildView
{
	Interactor2 *interactor = [[Interactor2 alloc] init];
	Presenter2 *presenter = [[Presenter2 alloc] initWithInteractor: interactor];
	ViewController2 *viewController = [[ViewController2 alloc] initWithPresenter: presenter];
	return viewController;
}

@end
