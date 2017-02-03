//
//  ViewController.m
//  MVVM
//
//  Created by Aalen on 2017/2/3.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "ViewModel.h"

@interface ViewController ()

@property (strong, nonatomic) ViewModel *viewModel;

@property (strong, nonatomic) UITextField *accountTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UILabel *informationLabel;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *logoutButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	_viewModel = [[ViewModel alloc] init];
	[self initAccountTextField];
	[self initPasswordTextField];
	[self initInformationLabel];
	[self initLoginButton];
	[self initLogoutButton];
	[self refresh];
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(refresh) name: kLoginStateChangedNotification object: nil];
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(onLoginFailed:) name: kLoginErrorNotification object: nil];
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

- (void)initInformationLabel
{
	_informationLabel = [[UILabel alloc] initWithFrame: CGRectMake(16.0, 64.0, self.view.bounds.size.width - 32.0, CGRectGetMaxY(_passwordTextField.frame) - CGRectGetMinY(_accountTextField.frame))];
	_informationLabel.font = [UIFont systemFontOfSize: 15.0];
	_informationLabel.textColor = [UIColor blackColor];
	_informationLabel.numberOfLines = 0;
	_informationLabel.lineBreakMode = NSLineBreakByWordWrapping;
	[self.view addSubview: _informationLabel];
}

- (void)initLoginButton
{
	_loginButton = [[UIButton alloc] initWithFrame: CGRectMake(16.0, 160.0, self.view.bounds.size.width - 32.0, 44.0)];
	_loginButton.layer.borderWidth = 0.5;
	[_loginButton setTitle: @"Login!" forState: UIControlStateNormal];
	[_loginButton setTitleColor: [self.view tintColor] forState: UIControlStateNormal];
	[_loginButton addTarget: self action: @selector(onLoginButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	[self.view addSubview: _loginButton];
}

- (void)initLogoutButton
{
	_logoutButton = [[UIButton alloc] initWithFrame: CGRectMake(16.0, 160.0, self.view.bounds.size.width - 32.0, 44.0)];
	_logoutButton.layer.borderWidth = 0.5;
	[_logoutButton setTitle: @"Quit!" forState: UIControlStateNormal];
	[_logoutButton setTitleColor: [self.view tintColor] forState: UIControlStateNormal];
	[_logoutButton addTarget: self action: @selector(onLogoutButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	[self.view addSubview: _logoutButton];
}

- (void)onLoginButtonPressed
{
	[_viewModel loginWithAccount: _accountTextField.text password: _passwordTextField.text];
}

- (void)onLogoutButtonPressed
{
	[_viewModel logout];
}

- (void)refresh
{
	if(_viewModel.online)
	{
		_accountTextField.hidden = YES;
		_passwordTextField.hidden = YES;
		_loginButton.hidden = YES;
		_informationLabel.hidden = NO;
		_logoutButton.hidden = NO;
		_informationLabel.text = [_viewModel getInformation];
	}
	else
	{
		_accountTextField.hidden = NO;
		_passwordTextField.hidden = NO;
		_loginButton.hidden = NO;
		_informationLabel.hidden = YES;
		_logoutButton.hidden = YES;
		_informationLabel.text = nil;
	}
}

- (void)onLoginFailed: (NSNotification *)notification
{
	NSDictionary *userInfo = notification.userInfo;
	[self showResult: userInfo[@"result"]];
}

- (void)showResult:(NSString *)message
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Warning" message: message preferredStyle: UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle: @"Confirm" style: UIAlertActionStyleDefault handler: nil];
	[alert addAction: action];
	[self presentViewController: alert animated: YES completion: nil];
}

@end
