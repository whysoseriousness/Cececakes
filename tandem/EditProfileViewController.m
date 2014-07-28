//
//  EditProfileViewController.m
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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
    // Do any additional setup after loading the view.
    self.nameTextField.text = [[PFUser currentUser] objectForKey:@"name"];
    self.ageTextField.text = [[PFUser currentUser] objectForKey:@"age"];
    self.locationTextField.text = [[PFUser currentUser] objectForKey:@"location"];
    self.descriptionTextField.text = [[PFUser currentUser] objectForKey:@"description"];
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

- (IBAction)saveProfileButtonPressed:(id)sender {
    NSString*name = self.nameTextField.text;
    [PFUser currentUser][@"name"] = name;
    NSString*age = self.ageTextField.text;
    [PFUser currentUser][@"age"] = age;
    NSString*location = self.locationTextField.text;
    [PFUser currentUser][@"location"] = location;
    NSString*description = self.descriptionTextField.text;
    [PFUser currentUser][@"description"] = description;

    [[PFUser currentUser]saveInBackground];
    
}
@end
