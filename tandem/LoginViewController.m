//
//  LoginViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//
//  NOTE ALL WARNINGS IN THIS FILE ARE A RESULT OF self.mainViewController
//  BEING OF TYPE UIViewController instead of ViewController

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


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
    self.emailTextField.delegate = self.mainViewController;
    self.passwordTextField.delegate = self.mainViewController;
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

- (IBAction)cancelButtonPressed:(id)sender {
    if ([self.mainViewController respondsToSelector:@selector(animateOutLoginFields)]) {
        [self.mainViewController performSelector:@selector(animateOutLoginFields) withObject:nil afterDelay:0.0f];
    }
}
- (IBAction)loginButtonPressed:(id)sender {
    if ([self.mainViewController respondsToSelector:@selector(loginUser)]) {
        [self.mainViewController performSelector:@selector(loginUser) withObject:nil afterDelay:0.0f];
    }
}
@end
