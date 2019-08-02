//
//  Presenter1.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "Presenter1.h"
#import "View1Protocol.h"
#import "Interactor1Protocol.h"
#import "Data.h"
#import "Router1.h"

@interface Presenter1 ()

@property (strong, nonatomic) id<Interactor1Input> interactor;

@end

@implementation Presenter1

@synthesize view = _view;

- (instancetype)initWithInteractor:(id<Interactor1Input>)interactor
{
	if(self = [super init])
	{
		_interactor = interactor;
		_interactor.output = self;
	}
	return self;
}

#pragma mark - Presenter1Protocol

- (void)loadData
{
	[_interactor loadData];
}

- (void)viewDidClickEdit
{
	[Router1 navigateToView2];
}

#pragma mark - Interactor1Output

- (void)dataDidLoad:(Data *)data
{
	[_view setImageWithName: data.imageName];
	[_view setViewTitle: data.title];
	[_view setViewDesc: data.desc];
}

@end
