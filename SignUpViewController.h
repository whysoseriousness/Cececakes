//
//  SignUpViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TransparentViewController.h"

@class ViewController;

@interface SignUpViewController : UIViewController{
    TransparentViewController *  transparentViewController;
}
@property ViewController * mainViewController;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)signUpButtonPressed:(id)sender;
@end
