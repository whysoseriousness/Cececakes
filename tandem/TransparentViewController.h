//
//  TransparentViewController.h
//  tandem
//
//  Created by Joshua Martin on 7/26/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TranparentViewControllerDelegate;

@interface TransparentViewController : UIViewController
@property UIViewController * loadingViewController;

@property (nonatomic, weak) id<TranparentViewControllerDelegate> delegate;

-(void)open;
-(void)close;
- (IBAction)cancelButtonPressed:(id)sender;

@end


@protocol TranparentViewControllerDelegate <NSObject>
@required
// No requred Methods
@optional
-(void) transparentViewControllerDidClose: (TransparentViewController * ) transparentViewController;
@end