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

-(void) viewWillAppear:(BOOL)animated{
//    [self.messageFieldToolbar removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self reloadInputViews];
    
    messagesTableViewFrameNormal = self.messagesTableView.frame;
    messagesTableViewFrameSmall  = self.messagesTableView.frame;
    messagesTableViewFrameSmall.size.height -= 216; // 216 is the height of the keyboard
//    NSDictionary *mine   = @{@"user" :   @"me", @"body" : @"test test test test test test test test test test test test test test test test test test test test test test test test test"};
//    NSDictionary *theirs = @{@"user" : @"them", @"body" : @"test test test test test test test test test test test"};
    self.tableData = [[NSMutableArray alloc] init];//WithObjects:mine, theirs, theirs, mine, mine, theirs, mine, nil];
    
    me = [PFUser currentUser];
    self.title = self.them[@"name"];
    
    [self loadData];
//    PFObject * fromMe = [PFObject objectWithClassName:@"Message" dictionary:@{@"sender" : me, @"receiver" : self.them, @"body" : @"Also, we should go to a movie afterwards and then make dinner and then make more crepes for dessert!"}];
//    PFObject * fromThem = [PFObject objectWithClassName:@"Message" dictionary:@{@"sender" : self.them, @"receiver" : me, @"body" : @"That's way too many crepes, I don't think we'll be able to do that many."}];
//    [fromMe saveInBackground];
//    [fromThem saveInBackground];
//    [PFObject saveAllInBackground:@[fromMe, fromThem]];
}

-(void) loadData{
    PFQuery * getMessagesFromMeToThem = [PFQuery queryWithClassName:@"Message"];
    [getMessagesFromMeToThem whereKey:@"sender" equalTo:me];
    [getMessagesFromMeToThem whereKey:@"receiver" equalTo:self.them];
    
    PFQuery * getMessagesFromThemToMe = [PFQuery queryWithClassName:@"Message"];
    [getMessagesFromThemToMe whereKey:@"sender" equalTo:self.them];
    [getMessagesFromThemToMe whereKey:@"receiver" equalTo:me];
    
    PFQuery * getMessages = [PFQuery orQueryWithSubqueries:@[getMessagesFromMeToThem, getMessagesFromThemToMe]];
    [getMessages setLimit:15];
    [getMessages orderByAscending:@"createdAt"];
    
    [getMessages findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.tableData = [NSMutableArray arrayWithArray:objects];
            [self.messagesTableView reloadData];
        }else{
            NSLog(@"chatview error: %@", error);
        }
    }];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
//
- (UIView *)inputAccessoryView {

    if(!composeMessageToolbar){
        composeMessageToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)];
        [composeMessageToolbar setBarStyle:UIBarStyleDefault];
        
        self.composeMessageTextField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 240.0f, 30.0f)];
        [self.composeMessageTextField setBorderStyle:UITextBorderStyleRoundedRect];
        self.composeMessageTextField.delegate = self;
        UIBarButtonItem * composeMessageTextFieldBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.composeMessageTextField];
        
        UIButton * submitMessageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [submitMessageButton setTitle:@"Send" forState:UIControlStateNormal];
        [submitMessageButton sizeToFit];
        UIBarButtonItem * submitMessageButtonBarButton = [[UIBarButtonItem alloc] initWithCustomView:submitMessageButton];
        [submitMessageButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
        
        [composeMessageToolbar setItems:@[composeMessageTextFieldBarButton, submitMessageButtonBarButton]];
        
    }
    return composeMessageToolbar;
}

-(void) sendMessage{
    PFObject * message = [PFObject objectWithClassName:@"Message" dictionary:@{@"sender" : me,
                                                                               @"receiver" : self.them,
                                                                               @"body" : self.composeMessageTextField.text}];
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // TODO: show a progress bar and complete it here
        }else{
            NSLog(@"[chatview sendmessage] error: %@", error);
        }
    }];
    
    [self.tableData addObject:message];
    [self.messagesTableView reloadData];
    [self scrollToBottom];
    self.composeMessageTextField.text = @"";
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    [UIView beginAnimations:@"maximizeTableView" context:nil];
    self.messagesTableView.frame = messagesTableViewFrameNormal;
    [UIView commitAnimations];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView beginAnimations:@"minimizeTableView" context:nil];
    self.messagesTableView.frame = messagesTableViewFrameSmall;
    [UIView commitAnimations];
    [self scrollToBottom];
//    [self.messagesTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void) scrollToBottom{
    [self.messagesTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.tableData count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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

#pragma mark - UITableViewDataSource Methods

-(CGRect) rectForString: (NSString*) content{
  
    UITableViewCell * cell = [self.messagesTableView dequeueReusableCellWithIdentifier:@"SentMessageCell"];
    UILabel * label = (UILabel *)[cell viewWithTag:1];
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName : label.font}
                                        context:nil];

    return rect;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * message = [self.tableData objectAtIndex:indexPath.row];
    PFUser * sender = message[@"sender"];
    BOOL received = [sender.objectId isEqualToString:self.them.objectId];
    NSString * identifier = (received)? @"ReceivedMessageCell" : @"SentMessageCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    UILabel * messageLabel = (UILabel *) [cell viewWithTag:1];
    messageLabel.numberOfLines = 0;
    messageLabel.text = message[@"body"];
//    [messageLabel sizeToFit];
    CGRect unshiftedFrame = [self rectForString:messageLabel.text];
    if (!received) { messageLabel.textAlignment = NSTextAlignmentRight; }
    messageLabel.frame = CGRectMake(messageLabel.frame.origin.x, messageLabel.frame.origin.y, unshiftedFrame.size.width, unshiftedFrame.size.height);
//    messageLabel.center = CGPointMake(300 - (messageLabel.frame.size.width/2), messageLabel.center.y);
//    messageLabel.frame = [self rectForString:messageLabel.text];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString * content = [[self.tableData objectAtIndex:indexPath.row] objectForKey:@"body"];
    CGRect rect = [self rectForString: content];
    return  rect.size.height + 12.0f;//MAX(rect.size.height, 44.0f) + 22.0f;// + 44.0f;
}


@end
