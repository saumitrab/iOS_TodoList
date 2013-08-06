//
//  TodoViewController.h
//  ToDo List
//
//  Created by Saumitra Bhanage on 8/3/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *todoTableView;

@property (nonatomic, strong) NSMutableArray *todoListArray;

- (IBAction) todoEditingDone;
- (void) updatedCellCustomCell;

@end
