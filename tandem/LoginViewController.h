//
//  LoginViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property UIViewController * mainViewController;

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)loginButtonPressed:(id)sender;
@end
