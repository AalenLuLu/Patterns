//
//  ViewController2.m
//  VIPER
//
//  Created by Aalen on 2019/8/1.
//  Copyright © 2019 Aalen. All rights reserved.
//

#import "ViewController2.h"
#import "Presenter2Protocol.h"

@interface ViewController2 ()

@property (strong, nonatomic) id<Presenter2Protocol> presenter;
@property (strong, nonatomic) UITextField *titleTextField;
@property (strong, nonatomic) UITextField *descTextField;
@property (strong, nonatomic) UIBarButtonItem *saveButton;

@end

@implementation ViewController2

- (instancetype)initWithPresenter:(id<Presenter2Protocol>)presenter
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
	self.view.backgroundColor = [UIColor yellowColor];
	[self.view addSubview: self.titleTextField];
	[self.view addSubview: self.descTextField];
	self.navigationItem.rightBarButtonItems = @[self.saveButton];
	
	[_presenter loadData];
}

#pragma mark - private function

- (void)_onSaveButtonPressed
{
	[_presenter saveWithTitle: self.titleTextField.text desc: self.descTextField.text];
}

#pragma mark - View2Protocol

- (void)setViewTitle:(NSString *)title
{
	self.titleTextField.text = title;
}

- (void)setViewDesc:(NSString *)desc
{
	self.descTextField.text = desc;
}

- (void)showSaveResult:(NSString *)result
{
	UIAlertAction *action = [UIAlertAction actionWithTitle: @"OK" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self.navigationController popViewControllerAnimated: YES];
	}];
	UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"" message: result preferredStyle: UIAlertControllerStyleAlert];
	[alert addAction: action];
	[self presentViewController: alert animated: YES completion: nil];
}

#pragma mark - lazy load

- (UITextField *)titleTextField
{
	if(nil == _titleTextField)
	{
		_titleTextField = [[UITextField alloc] initWithFrame: CGRectMake(30.0, 100.0, self.view.bounds.size.width - 60.0, 30.0)];
		_titleTextField.borderStyle = UITextBorderStyleRoundedRect;
	}
	return _titleTextField;
}

- (UITextField *)descTextField
{
	if(nil == _descTextField)
	{
		_descTextField = [[UITextField alloc] initWithFrame: CGRectMake(30.0, 150.0, self.view.bounds.size.width - 60.0, 30.0)];
		_descTextField.borderStyle = UITextBorderStyleRoundedRect;
	}
	return _descTextField;
}

- (UIBarButtonItem *)saveButton
{
	if(nil == _saveButton)
	{
		_saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSave target: self action: @selector(_onSaveButtonPressed)];
	}
	return _saveButton;
}

@end
