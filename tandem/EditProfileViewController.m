//
//  EditProfileViewController.m
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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
    // Do any additional setup after loading the view.
    self.nameTextField.text = [[PFUser currentUser] objectForKey:@"name"];
    self.ageTextField.text = [[PFUser currentUser] objectForKey:@"age"];
    self.locationTextField.text = [[PFUser currentUser] objectForKey:@"location"];
    self.descriptionTextField.text = [[PFUser currentUser] objectForKey:@"description"];
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

- (IBAction)saveProfileButtonPressed:(id)sender {
    NSString*name = self.nameTextField.text;
    [PFUser currentUser][@"name"] = name;
    NSString*age = self.ageTextField.text;
    [PFUser currentUser][@"age"] = age;
    NSString*location = self.locationTextField.text;
    [PFUser currentUser][@"location"] = location;
    NSString*description = self.descriptionTextField.text;
    [PFUser currentUser][@"description"] = description;

    [[PFUser currentUser]saveInBackground];
    
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
