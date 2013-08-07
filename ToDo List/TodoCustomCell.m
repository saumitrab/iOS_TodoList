//
//  TodoCustomCell.m
//  ToDo List
//
//  Created by Saumitra Bhanage on 8/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import "TodoCustomCell.h"
#import "TodoViewController.h"

@implementation TodoCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //self.textfieldNewTodoItem.delegate = self;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
