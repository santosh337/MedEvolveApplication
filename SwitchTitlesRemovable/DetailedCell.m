//
//  DetailedCell.m
//  SwitchTitlesRemovable
//
//  Created by pressmartmac on 4/14/16.
//  Copyright © 2016 pressmartmac. All rights reserved.
//

#import "DetailedCell.h"

@implementation DetailedCell
@synthesize detailedLabel,onOFFSwitch;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        detailedLabel = [[UILabel alloc]init];
        detailedLabel.backgroundColor = [UIColor clearColor];
        detailedLabel.textColor = [UIColor blackColor];
        detailedLabel.font = [UIFont boldSystemFontOfSize:19.0];
        detailedLabel.textAlignment = NSTextAlignmentRight;
        detailedLabel.text = @"+56%";
        
        onOFFSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        [onOFFSwitch setOn:YES animated:NO];
        
        [self.contentView addSubview:detailedLabel];
        self.accessoryView = onOFFSwitch;
        
    }
    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    detailedLabel.frame = CGRectMake(self.frame.origin.x+9, 4, 120, 30);
    
    
}
@end
