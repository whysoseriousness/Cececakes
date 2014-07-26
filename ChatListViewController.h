//
//  ChatListViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/21/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatPreviewTableViewCell.h"

@interface ChatListViewController : UIViewController <UITableViewDataSource>
@property NSMutableArray * tableData;
@end
