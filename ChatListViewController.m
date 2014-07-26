//
//  ChatListViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/21/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "ChatListViewController.h"

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationController.navigationBar.topItem.title = @"Chats";
    self.title = @"Chats";
    self.tableData = [NSMutableArray arrayWithObjects:@{@"name" : @"Josh", @"lastMessagePreview" : @"Let's tandem! :D", @"time" : @"1:13"}, nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatPreviewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ChatPreviewTableViewCell" forIndexPath:indexPath];
    NSDictionary * data = [self.tableData objectAtIndex:indexPath.row];

    cell.nameLabel.text = data[@"name"];
    cell.lastMessagePreviewLabel.text = data[@"lastMessagePreview"];
    cell.dateLabel.text = data[@"time"];
    
    return cell;
}

@end
