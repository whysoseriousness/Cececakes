//
//  BikeBuddiesViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "BikeBuddiesViewController.h"

@interface BikeBuddiesViewController ()

@end

@implementation BikeBuddiesViewController

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
    self.tableData = [NSMutableArray arrayWithObject:@{@"name" : @"Josh", @"age" : @"21"}];
    [self loadData];
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
#pragma mark - Data

- (void) loadData{
//    self.tableData = [data from server] TODO
//    [self.bikeBuddiesTableView reloadData];
}

#pragma mark - UITableViewDataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BikeBuddyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BikeBuddyTableViewCell" forIndexPath:indexPath];
    NSDictionary * buddy = [self.tableData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.nameLabel.text = [buddy objectForKey:@"name"];
    
    return cell;
}

@end
