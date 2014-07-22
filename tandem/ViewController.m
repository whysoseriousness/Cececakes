//
//  ViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/20/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    loginViewController.mainViewController = self;
    [self.view addSubview: loginViewController.view];
    
    CGRect loginViewFrame = loginViewController.view.frame;
    loginViewFrame.origin.y = 225;
    loginViewFrame.origin.x = loginViewFrame.origin.x + self.view.frame.size.width;
    loginViewController.view.frame = loginViewFrame;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonClicked:(id)sender {
    [UIView beginAnimations:@"slideUI" context:nil];
//        self.loginButton.transform         = CGAffineTransformMakeTranslation(-1.5 * self.view.frame.size.width, 0.0f);
//        self.createAccountButton.transform = CGAffineTransformMakeTranslation(-1.5 * self.view.frame.size.width, 0.0f);
        self.loginButton.transform         = CGAffineTransformMakeTranslation(0.0f, 1.25 * self.view.frame.size.width);
        self.createAccountButton.transform = CGAffineTransformMakeTranslation(0.0f, 1.25 * self.view.frame.size.width);
        loginViewController.view.transform = CGAffineTransformMakeTranslation(-1 * self.view.frame.size.width, 0.0f);
    [UIView commitAnimations];
}

- (void) animateOutLoginFields{
    [UIView beginAnimations:@"slideUI" context:nil];
    self.loginButton.transform         = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    self.createAccountButton.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    loginViewController.view.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    [UIView commitAnimations];
}

- (void) loginUser{
    // TODO: submit and manage login request
    [self performSegueWithIdentifier:@"LoginToMenuSegue" sender:self];
}

@end
