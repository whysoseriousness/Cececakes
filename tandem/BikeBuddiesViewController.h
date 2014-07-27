//
//  BikeBuddiesViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BikeBuddyTableViewCell.h"
#import <Parse/Parse.h>

@interface BikeBuddiesViewController : UIViewController <UITableViewDataSource>

@property NSMutableArray * tableData;
@property (weak, nonatomic) IBOutlet UITableView *bikeBuddiesTableView;

@end
