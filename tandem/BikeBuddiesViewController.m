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
    
    self.tableData = [NSMutableArray array];
    
    /*self.tableData = [NSMutableArray arrayWithObjects:
                      @{@"name" : @"Josh",
                        @"age" : @"21",
                        @"location":@"new york",
                        @"description":@"I make code",
                        @"own":@"Owns a tandem bike"},
                      
                      @{@"name" : @"cece",
                        @"age" : @"22",
                        @"location":@"washington,dc",
                        @"description":@"i make crepes",
                        @"own":@"Without a tandem bike"},
                      
                      @{@"name":@"sweeet mario",
                        @"age" : @"25",
                        @"location":@"new york",
                        @"description":@"part-time gap model",
                        @"own":@"Without a tandem bike"},
                      nil];
    */
    
    PFQuery *query = [PFUser query];
    [query findObjectsInBackgroundWithBlock: ^(NSArray *objects, NSError *error) {
        if (!error) {
            self.tableData = objects;
            // self.tableData is an NSMutableArray (mutable means it can accept new, and delete unused objects
            // objects is an NSArray (once the data is set, it can never change)
            // The error is being thrown because you're assigning an NSArray to and NSMutableArray object
            [self.bikeBuddiesTableView reloadData];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
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

//- (void) loadData{
//    self.tableData = [data from server] TODO
//    [self.bikeBuddiesTableView reloadData];
//}

#pragma mark - UITableViewDataSource Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BikeBuddyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BikeBuddyTableViewCell" forIndexPath:indexPath];
    
    NSDictionary * buddy = [self.tableData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    
    cell.nameLabel.text = [buddy objectForKey:@"name"];
    cell.ageDistanceLabel.text = [NSString stringWithFormat:@"%@ | %@", [buddy objectForKey:@"age"], [buddy objectForKey:@"location"]];
    cell.descriptionLabel.text = [buddy objectForKey:@"description"];
//    cell.ownsBikeLabel.text = [buddy objectForKey:@"own"];
    
    return cell;
}

@end
