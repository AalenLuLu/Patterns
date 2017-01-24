//
//  ViewController.m
//  MVP
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "LoginViewProtocol.h"
#import "LoginPresenter.h"

@interface ViewController () <LoginViewProtocol>

@property (strong, nonatomic) UITextField *accountTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) LoginPresenter *loginPresenter;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor whiteColor];
	_loginPresenter = [[LoginPresenter alloc] initWithView: self];
	[self initAccountTextField];
	[self initPasswordTextField];
	[self initCheckButton];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)initAccountTextField
{
	_accountTextField = [[UITextField alloc] initWithFrame: CGRectMake(50.0, 64.0, 150.0, 30.0)];
	_accountTextField.borderStyle = UITextBorderStyleRoundedRect;
	_accountTextField.placeholder = @"0-9A-Za-z";
	[self.view addSubview: _accountTextField];
}

- (void)initPasswordTextField
{
	_passwordTextField = [[UITextField alloc] initWithFrame: CGRectMake(50.0, 112.0, 150.0, 30.0)];
	_passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	_passwordTextField.placeholder = @"more than 6";
	_passwordTextField.secureTextEntry = YES;
	[self.view addSubview: _passwordTextField];
}

- (void)initCheckButton
{
	UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(16.0, 160.0, self.view.bounds.size.width - 32.0, 44.0)];
	button.layer.borderWidth = 0.5;
	[button setTitle: @"Check!" forState: UIControlStateNormal];
	[button setTitleColor: [self.view tintColor] forState: UIControlStateNormal];
	[button addTarget: self action: @selector(onCheckButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	[self.view addSubview: button];
}

- (void)onCheckButtonPressed
{
	[_loginPresenter loginWithAccount: _accountTextField.text password: _passwordTextField.text];
}

- (void)showResult:(NSString *)message
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Warning" message: message preferredStyle: UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle: @"Confirm" style: UIAlertActionStyleDefault handler: nil];
	[alert addAction: action];
	[self presentViewController: alert animated: YES completion: nil];
}

@end
