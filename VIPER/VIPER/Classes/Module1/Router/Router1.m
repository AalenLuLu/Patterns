//
//  Router1.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Router1.h"
#import "ViewController1.h"
#import "Interactor1.h"
#import "Presenter1.h"

#import "Router2.h"

@implementation Router1

+ (void)showViewAsRoot
{
	ViewController1 *vc = [self _buildView];
	UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController: vc];
	[UIApplication sharedApplication].delegate.window.rootViewController = navi;
}

+ (void)navigateToView
{
	[((UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController) pushViewController: [self _buildView] animated: YES];
}

+ (void)navigateToView2
{
	[Router2 navigateToView];
}

+ (ViewController1 *)_buildView
{
	Interactor1 *interactor = [[Interactor1 alloc] init];
	Presenter1 *presenter = [[Presenter1 alloc] initWithInteractor: interactor];
	ViewController1 *viewController = [[ViewController1 alloc] initWithPresenter: presenter];
	return viewController;
}

@end
