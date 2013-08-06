//
//  TodoCustomCell.h
//  ToDo List
//
//  Created by Saumitra Bhanage on 8/5/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoCustomCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textfieldNewTodoItem;

@end
