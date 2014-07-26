//
//  TransparentViewController.m
//  tandem
//
//  Created by Joshua Martin on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "TransparentViewController.h"

@interface TransparentViewController ()

@end

@implementation TransparentViewController

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


-(void)open{
    
    self.view.alpha = 0.0f;
    [self.loadingViewController.view addSubview:self.view];
    
    [UIView beginAnimations:@"test" context:nil];
    [UIView setAnimationDuration:0.25f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.view.alpha = 1.0f;
    [UIView commitAnimations];
    
}

-(void)close{
    
    [UIView animateWithDuration:0.25f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(transparentViewControllerDidClose:)]) {
        [self.delegate transparentViewControllerDidClose:self];
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self close];
    // TODO: send message to loadingViewController to cancel Request
}

@end
