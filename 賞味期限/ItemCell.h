//
//  ItemCell.h
//  賞味期限
//
//  Created by 田所　龍 on 2015/02/26.
//  Copyright (c) 2015年 田所　龍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell<UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *basyoLabel;
@property (weak, nonatomic) IBOutlet UILabel *kigenLabel;

- (IBAction)upButtonPushed:(UIButton *)buttonInfo;
- (IBAction)downButtonPushed:(UIButton *)buttonInfo;



@end
