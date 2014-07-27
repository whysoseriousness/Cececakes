//
//  EditProfileViewController.h
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *editNameViewController;
@property (weak, nonatomic) IBOutlet UITextField *editAgeViewController;
@property (weak, nonatomic) IBOutlet UITextField *editLocationViewController;
@property (weak, nonatomic) IBOutlet UITextField *editInfoPersoViewController;
@property (weak, nonatomic) IBOutlet UISwitch *editBikeOwnerViewController;
- (IBAction)saveProfileButtonPressed:(id)sender;

@end
