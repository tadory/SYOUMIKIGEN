//
//  ZAIKO.h
//  賞味期限
//
//  Created by 田所　龍 on 2015/02/19.
//  Copyright (c) 2015年 田所　龍. All rights reserved.
//

#import <UIKit/UIKit.h>
//@property (nonatomic,weak) IBOutlet UISearchBar *search;

@interface ZAIKO : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    IBOutlet UITableView *itemTableview;
    IBOutlet UIBarButtonItem *sakuzyoButton;
    
    NSMutableArray *contentArray;
    NSMutableArray *searchItemArray;
    
    BOOL douka;
}
-(IBAction)sakuzyobutton;
-(IBAction)hensyuubutton;
-(IBAction)UP;
-(IBAction)DOWN;

@end