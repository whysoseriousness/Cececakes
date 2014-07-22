//
//  ChatPreviewTableViewCell.m
//  tandem
//
//  Created by Joshua Martin on 7/22/14.
//  Copyright (c) 2014 Joshua Martin. All rights reserved.
//

#import "ChatPreviewTableViewCell.h"

@implementation ChatPreviewTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
