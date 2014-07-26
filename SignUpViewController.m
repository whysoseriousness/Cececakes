//
//  SignUpViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "SignUpViewController.h"
#import "ViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    self.confirmPasswordTextField.delegate = self.mainViewController;
    
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

- (IBAction)signUpButtonPressed:(id)sender {
   transparentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TransparentViewController"];
    transparentViewController.loadingViewController = self.mainViewController;
    [transparentViewController open];
    
    NSString * email                = self.emailTextField.text;
    NSString * password             = self.passwordTextField.text;
    NSString * passwordConfirmation = self.confirmPasswordTextField.text;
    
    if (![email isEqualToString:@""] && ![password isEqualToString:@""] && [password isEqualToString:passwordConfirmation]) {
        [self requestSignUp];
    }
}

-(void) requestSignUp{
//    if(true) return;
    
    PFUser *user  = [PFUser user];
    user.password = self.passwordTextField.text;
    user.email    = self.emailTextField.text;
    user.username = user.email;
    
//    other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            if ([self.mainViewController respondsToSelector:@selector(loginUser)]) {
                [self.mainViewController performSelector:@selector(loginUser) withObject:nil afterDelay:0.0f];
            }
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"errorString: %@", errorString);
            // Show the errorString somewhere and let the user try again.
        }
        [transparentViewController close];
    }];
}

@end
