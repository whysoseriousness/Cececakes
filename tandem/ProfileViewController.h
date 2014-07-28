//
//  ProfileViewController.h
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/27/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController : UIViewController
@property (nonatomic,strong) PFUser *profileuser;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
