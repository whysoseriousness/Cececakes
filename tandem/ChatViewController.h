//
//  ChatViewController.h
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/25/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ChatViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>{
    UIToolbar * composeMessageToolbar;
    CGRect messagesTableViewFrameNormal;
    CGRect messagesTableViewFrameSmall;
    PFUser * me;
}
@property (weak, nonatomic) IBOutlet UITableView *messagesTableView;
@property NSMutableArray * tableData;
@property PFUser * them;
@property UITextField * composeMessageTextField;

@end
