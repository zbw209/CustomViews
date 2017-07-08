//
//  TableVC.m
//  CustomViews
//
//  Created by 周必稳 on 2017/6/14.
//  Copyright © 2017年 zbw. All rights reserved.
//

#import "TableVC.h"

@interface TableVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath.row = %ld",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
