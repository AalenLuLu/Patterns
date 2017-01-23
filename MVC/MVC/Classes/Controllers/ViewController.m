//
//  ViewController.m
//  MVC
//
//  Created by Aalen on 2017/1/22.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "DataModel.h"

#import "TableView.h"
#import "TableViewCell.h"

static NSString * const kCellIdentifier = @"cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, DataModelProtocol>

@property (strong, nonatomic) NSMutableArray<NSDictionary *> *dataSource;
@property (strong, nonatomic) DataModel *model;
@property (strong, nonatomic) TableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor lightGrayColor];
	_model = [[DataModel alloc] init];
	_model.delegate = self;
	[self initTableView];
	[self initAddButton];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)initTableView
{
	_tableView = [[TableView alloc] initWithFrame: CGRectMake(0, 64.0, self.view.bounds.size.width * 0.7, self.view.bounds.size.height * 0.7)];
	_tableView.dataSource = self;
	_tableView.delegate = self;
	
	[_tableView registerClass: [TableViewCell class] forCellReuseIdentifier: kCellIdentifier];
	
	[self.view addSubview: _tableView];
}

- (void)initAddButton
{
	UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 64.0)];
	[button setTitle: NSLocalizedString(@"addbuttontitle", @"Add") forState: UIControlStateNormal];
	[button setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
	[button addTarget: self action: @selector(onAddButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	[self.view addSubview: button];
}

- (void)onAddButtonPressed
{
	[_model addData];
}

- (void)didAddData:(NSArray *)newData
{
	if(nil == _dataSource)
	{
		_dataSource = [[NSMutableArray alloc] initWithCapacity: 5];
	}
	NSMutableArray *indexs = [[NSMutableArray alloc] initWithCapacity: 5];
	for(int i = 0;i < newData.count;i++)
	{
		[indexs addObject: [NSIndexPath indexPathForRow: _dataSource.count + i inSection: 0]];
	}
	[_dataSource addObjectsFromArray: newData];
	[_tableView insertRowsAtIndexPaths: indexs withRowAnimation: UITableViewRowAnimationTop];
	[_tableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: _dataSource.count - 1 inSection: 0] atScrollPosition: UITableViewScrollPositionBottom animated: YES];
}

- (void)didChangeData:(NSArray *)newData
{
	if(nil == _dataSource)
	{
		_dataSource = [[NSMutableArray alloc] initWithCapacity: 5];
	}
	else
	{
		[_dataSource removeAllObjects];
	}
	[_dataSource addObjectsFromArray: newData];
	[_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *data = _dataSource[indexPath.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: kCellIdentifier forIndexPath: indexPath];
	cell.textLabel.text = data[@"name"];
	cell.detailTextLabel.text = data[@"time"];
	return cell;
}

@end
