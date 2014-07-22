//
//  ChatPreviewTableViewCell.h
//  tandem
//
//  Created by Joshua Martin on 7/22/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatPreviewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastMessagePreviewLabel;

@end
