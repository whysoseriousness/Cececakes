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
        self.loginButton.transform         = CGAffineTransformMakeTranslation(0.0f, 1.25 * self.view.frame.size.width);
        self.createAccountButton.transform = CGAffineTransformMakeTranslation(0.0f, 1.25 * self.view.frame.size.width);
        loginViewController.view.transform = CGAffineTransformMakeTranslation(-1 * self.view.frame.size.width, 0.0f);
    [UIView commitAnimations];
    
    /* keyboard should not be visible, move views down (if they are already down nothing will happen) */
    [self slideDownWithKeyboard];
}

- (void) animateOutLoginFields{
    [UIView beginAnimations:@"slideUI" context:nil];
    self.loginButton.transform         = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    self.createAccountButton.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    loginViewController.view.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    [UIView commitAnimations];
    
    
    /* keyboard should not be visible, move views down (if they are already down nothing will happen) */
    [self slideDownWithKeyboard];
}

- (void) loginUser{
    // TODO: submit and manage login request
    [self performSegueWithIdentifier:@"LoginToMenuSegue" sender:self];
}


#pragma mark - TextField Related View Repositiong Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    /* keyboard is visible, move views up */
    [self slideUpWithKeyboard];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
        /* keyboard is no longer visible, move views down */
        [self slideDownFromTextField:textField];
        return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* keyboard is no longer visible, move views down */
    [self slideDownWithKeyboard];
//    for (UIView * txt in self.view.subviews){
//        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
////            [self slideDownFromTextField: (UITextField *) txt];
//        }
//    }
}

-(void) slideUpWithKeyboard{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.275];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.view.transform = CGAffineTransformMakeTranslation(0.0f, -1 * kKeyboardHeight);
    [UIView commitAnimations];
}

-(void) slideDownWithKeyboard{
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.view.transform = CGAffineTransformMakeTranslation(0.0f, 0.0f);
    [UIView commitAnimations];
}

-(void) slideDownFromTextField: (UITextField * ) textField{
    [textField resignFirstResponder];
    [self slideDownWithKeyboard];
}

@end
