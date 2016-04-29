//
//  ViewController.m
//  HelloJSPatch
//
//  Created by Origheart on 16/4/28.
//  Copyright © 2016年 Origheart. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import <objc/runtime.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Class class = NSClassFromString(@"DataManager");
//    id dataManager = [[class alloc] init];
//    SEL selector = NSSelectorFromString(@"saveData");
//    [dataManager performSelector:selector];
    
    self.tableView.tableFooterView = [UIView new];
    self.title = @"今日头条";
    
    // 因为某些原因导致数据源数据被删
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataSource removeLastObject];
    });
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 上线后发现高度不够，有些内容显示不全
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* i=  @"Cell";
    UITableViewCell* cell = [tableView  dequeueReusableCellWithIdentifier:i];
    cell.textLabel.text = [self textForIndex:indexPath];
    //我在这里给cell的背景颜色是白色，但是上线后发现青色更好看，我就在JS里写了红色。
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 当我点击最后一行的时候可能会数组越界导致 crash
    // 还好我在JS里弥补了这个bug，详情请看JS里的处理
    NSString *content = self.dataSource[indexPath.row];
    NSLog(@"content = %@",content);
}

#pragma mark - Private_M

- (NSString*)textForIndex:(NSIndexPath*)indexPath
{
    return self.dataSource[indexPath.row];
}

#pragma mark - Getters

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [@[@"Apple Watch 一年了，它能成为苹果的“新 iPhone”吗？",
                         @"微软烧钱新项目让你可以把 Windows 写进 DNA 里",
                         @"多些真诚少些套路，如何选一款舒适好用的鼠标？",
                         @"想让 Windows 拥有 Mac 的优雅效率，这 6 招可以帮你！"] mutableCopy];
    }
    return _dataSource;
}


@end
