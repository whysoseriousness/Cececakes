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
#import "ViewController.h"

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
    if ([self.mainViewController respondsToSelector:@selector(animateOutTextFields)]) {
        [self.mainViewController performSelector:@selector(animateOutTextFields) withObject:nil afterDelay:0.0f];
    }
}

- (IBAction)loginButtonPressed:(id)sender {
    NSString * email = self.emailTextField.text;
    NSString * password = self.passwordTextField.text;
    if (![email isEqualToString:@""] && ![password isEqualToString:@""]) {
        transparentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TransparentViewController"];
        transparentViewController.loadingViewController = self.mainViewController;
        [transparentViewController open];
        
        [PFUser logInWithUsernameInBackground:email password:password block:^(PFUser *user, NSError *error) {
            if(!error){
                if ([self.mainViewController respondsToSelector:@selector(loginUser)]) {
                    [self.mainViewController performSelector:@selector(loginUser) withObject:nil afterDelay:0.0f];
                }
            }else{
                NSLog(@"Error When Logging In: %@", error);
            }
            [transparentViewController close];
        }];
    }
}

@end
