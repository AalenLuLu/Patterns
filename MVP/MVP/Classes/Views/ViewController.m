//
//  ViewController.m
//  MVP
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "AccountPresenter.h"
#import "PasswordPresenter.h"
#import "InputCheckPresenter.h"
#import "LoginPresenter.h"

@interface ViewController ()

@property (strong, nonatomic) AccountPresenter *accountPresenter;
@property (strong, nonatomic) PasswordPresenter *passwordPresenter;
@property (strong, nonatomic) LoginPresenter *loginPresenter;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor whiteColor];
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
	UITextField *accountTextField = [[UITextField alloc] initWithFrame: CGRectMake(50.0, 64.0, 150.0, 30.0)];
	accountTextField.borderStyle = UITextBorderStyleRoundedRect;
	accountTextField.placeholder = @"0-9A-Za-z";
	[self.view addSubview: accountTextField];
	_accountPresenter = [[AccountPresenter alloc] initWithTextField: accountTextField];
}

- (void)initPasswordTextField
{
	UITextField *passwordTextField = [[UITextField alloc] initWithFrame: CGRectMake(50.0, 112.0, 150.0, 30.0)];
	passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	passwordTextField.placeholder = @"more than 6";
	passwordTextField.secureTextEntry = YES;
	[self.view addSubview: passwordTextField];
	_passwordPresenter = [[PasswordPresenter alloc] initWithTextField: passwordTextField];
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
	InputCheckPresenter *checkPresenter = [[InputCheckPresenter alloc] initWithAccount: _accountPresenter password: _passwordPresenter];
	self.loginPresenter = [[LoginPresenter alloc] initWithAccount: _accountPresenter.textField.text password: _passwordPresenter.textField.text checkPresenter: checkPresenter];
	[_loginPresenter loginWithCompletion: ^(NSError *error) {
		NSString *message = @"Login Success!";
		if(error)
		{
			message = error.userInfo[@"result"];
		}
		UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Warning" message: message preferredStyle: UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle: @"Confirm" style: UIAlertActionStyleDefault handler: nil];
		[alert addAction: action];
		[self presentViewController: alert animated: YES completion: nil];
	}];
}

@end
