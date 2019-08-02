//
//  Presenter2.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Presenter2.h"
#import "View2Protocol.h"
#import "Interactor2Protocol.h"
#import "Data.h"

@interface Presenter2 ()

@property (strong, nonatomic) id<Interactor2Protocol> interactor;

@end

@implementation Presenter2

@synthesize view = _view;

- (instancetype)initWithInteractor:(id<Interactor2Protocol>)interactor
{
	if(self = [super init])
	{
		_interactor = interactor;
		[self bindInteractorHandler];
	}
	return self;
}

- (void)bindInteractorHandler
{
	__weak __typeof__(self) ws = self;
	_interactor.dataDidLoadHandler = ^(Data *data) {
		[ws.view setViewTitle: data.title];
		[ws.view setViewDesc: data.desc];
	};
	_interactor.dataDidSaveHandler = ^(BOOL success) {
		[ws.view showSaveResult: success ? @"Save" : @"Save Failed"];
	};
}

#pragma mark - Presenter2Protocol

- (void)loadData
{
	[_interactor loadData];
}

- (void)saveWithTitle:(NSString *)title desc:(NSString *)desc
{
	Data *data = [[Data alloc] init];
	data.title = title;
	data.desc = desc;
	[_interactor saveWithData: data];
}

@end
