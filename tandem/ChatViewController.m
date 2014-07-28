//
//  ChatViewController.m
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/25/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
////    [self.messageFieldToolbar removeFromSuperview];
//    
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.messageTextField.inputAccessoryView = self.messageFieldToolbar;
//    [self.view setNeedsDisplay];
//
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//-(BOOL) textFieldShouldBeginEditing:(UITextField*)textField {
//    NSLog(@"butts");
////    if([textField isEqual:self.messageTextField]){
////    textField.inputAccessoryView = self.messageFieldToolbar;
////    }
//    return YES;
//}
//
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//    return YES;
//}
//

-(void) viewWillAppear:(BOOL)animated{
    [self.messageFieldToolbar removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadInputViews];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
//
- (UIView *)inputAccessoryView {
////    if (!_textField) {
////        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
////        _textField.backgroundColor = [UIColor whiteColor];
////        _textField.delegate = self;
////    }
//    
    return self.messageFieldToolbar;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)sendButtonPressed:(id)sender {
    [self.view endEditing:YES];
}
@end
