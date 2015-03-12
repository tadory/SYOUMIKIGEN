//
//  ZAIKO.m
//  賞味期限
//
//  Created by 田所　龍 on 2015/02/19.
//  Copyright (c) 2015年 田所　龍. All rights reserved.
//

#import "ZAIKO.h"
#import "Item.h"
#import "ItemCell.h"


@implementation ZAIKO
-(void)viewDidLoad{
    [super viewDidLoad];
    
    itemTableview.delegate = self;
    itemTableview.dataSource = self;
    
    NSData* classDataLoad = [[NSUserDefaults standardUserDefaults]  dataForKey:@"ItemArray"];
    contentArray = [NSKeyedUnarchiver unarchiveObjectWithData:classDataLoad];
    
    [self.searchDisplayController.searchResultsTableView setRowHeight:itemTableview.rowHeight];
    
    [self.searchDisplayController.searchResultsTableView registerClass:[ItemCell class] forCellReuseIdentifier:@"ItemCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView ==  self.searchDisplayController.searchResultsTableView) {
        NSLog(@"%d", searchItemArray.count);
        return searchItemArray.count;
    } else {
        return contentArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ItemCell";
    ItemCell *cell = (ItemCell *)[itemTableview dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Item *item;
    if (tableView ==  self.searchDisplayController.searchResultsTableView) {
        item = searchItemArray[indexPath.row];
    } else {
        item = contentArray[indexPath.row];
    }
    
    cell.nameLabel.text = item.name;
    cell.basyoLabel.text = item.basyo;
    cell.countLabel.text = [NSString stringWithFormat:@"%d個",(int)item.count];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy/MM/dd";
    
    cell.kigenLabel.text = [df stringFromDate:item.limitDate];
    
    return cell;
    
//    if (tableView ==  self.searchDisplayController.searchResultsTableView) {
//        UITableViewCell  *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        cell.textLabel.text =  @"aaaaa";
//        return cell;
//    } else {
//        static NSString *cellIdentifier = @"ItemCell";
//        ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//
//        Item *item = contentArray[indexPath.row];
//        cell.nameLabel.text = item.name;
//        cell.basyoLabel.text = item.basyo;
//        cell.countLabel.text = [NSString stringWithFormat:@"%d個",(int)item.count];
//        
//        NSDateFormatter *df = [[NSDateFormatter alloc] init];
//        df.dateFormat = @"yyyy/MM/dd";
//        
//        cell.kigenLabel.text = [df stringFromDate:item.limitDate];
//        
//        return cell;
//    }
}

- (void)filterContainsWithSearchText:(NSString *)searchText
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    
    searchItemArray = [contentArray filteredArrayUsingPredicate:predicate];
    NSLog(@"%@", searchItemArray);
}

- (BOOL)searchDisplayController:controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // 検索バーに入力された文字列を引数に、絞り込みをかけます
    [self filterContainsWithSearchText:searchString];
    
    // YESを返すとテーブルビューがリロードされます。
    // リロードすることでsearchItemArrayからテーブルビューを表示します
    return YES;
}



@end
