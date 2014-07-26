//
//  TransparentViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransparentViewController : UIViewController
@property UIViewController * loadingViewController;

-(void)open;
-(void)close;
- (IBAction)cancelButtonPressed:(id)sender;
@end
