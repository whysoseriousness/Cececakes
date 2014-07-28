//
//  ChatViewController.h
//  tandem
//
//  Created by Cécile Schilis-Gallego on 7/25/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController<UITextFieldDelegate, UIToolbarDelegate>{
    UITextField * _textField;
}
@property (weak, nonatomic) IBOutlet UITextField *triggerTextField;
@property (weak, nonatomic) IBOutlet UIToolbar *messageFieldToolbar;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
- (IBAction)sendButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *testView;

@end
