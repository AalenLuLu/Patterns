//
//  ViewController1.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "ViewController1.h"
#import "Presenter1Protocol.h"

@interface ViewController1 ()

@property (strong, nonatomic) id<Presenter1Protocol> presenter;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;
@property (strong, nonatomic) UIBarButtonItem *editButton;

@end

@implementation ViewController1

- (instancetype)initWithPresenter:(id<Presenter1Protocol>)presenter
{
	if(self = [super init])
	{
		_presenter = presenter;
		_presenter.view = self;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview: self.titleLabel];
	[self.view addSubview: self.descLabel];
	[self.view addSubview: self.imageView];
	self.navigationItem.rightBarButtonItems = @[self.editButton];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[_presenter loadData];
}

#pragma mark - private function

- (void)_onEditButtonPressed
{
	[_presenter viewDidClickEdit];
}

#pragma mark - View1Protocol

- (void)setImageWithName:(NSString *)imageName
{
	self.imageView.image = [UIImage imageNamed: imageName];
}

- (void)setViewTitle:(NSString *)title
{
	self.titleLabel.text = title;
}

- (void)setViewDesc:(NSString *)desc
{
	self.descLabel.text = desc;
}

#pragma mark - lazy load

- (UIImageView *)imageView
{
	if(nil == _imageView)
	{
		_imageView = [[UIImageView alloc] initWithFrame: CGRectMake(100, 300, 100, 100)];
	}
	return _imageView;
}

- (UILabel *)titleLabel
{
	if(nil == _titleLabel)
	{
		_titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 100.0, self.view.bounds.size.width, 20.0)];
		_titleLabel.font = [UIFont systemFontOfSize: 16.0];
		_titleLabel.textColor = [UIColor blackColor];
		_titleLabel.textAlignment = NSTextAlignmentCenter;
	}
	return _titleLabel;
}

- (UILabel *)descLabel
{
	if(nil == _descLabel)
	{
		_descLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 150.0, self.view.bounds.size.width, 17.0)];
		_descLabel.font = [UIFont systemFontOfSize: 14.0];
		_descLabel.textColor = [UIColor grayColor];
		_descLabel.textAlignment = NSTextAlignmentCenter;
	}
	return _descLabel;
}

- (UIBarButtonItem *)editButton
{
	if(nil == _editButton)
	{
		_editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemEdit target: self action: @selector(_onEditButtonPressed)];
	}
	return _editButton;
}

@end
