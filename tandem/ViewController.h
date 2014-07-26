//
//  ViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>{
    LoginViewController * loginViewController;
    SignUpViewController * signUpViewController;
}

- (IBAction) loginButtonClicked:(id)sender;
- (IBAction)createAccountButtonClicked:(id)sender;
- (void) animateOutTextFields;
- (void) loginUser;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;
@end
