//
//  TodoViewController.m
//  ToDo List
//
//  Created by Saumitra Bhanage on 8/3/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\saumitra. All rights reserved.
//

#import "TodoViewController.h"
#import "TodoCustomCell.h"

@interface TodoViewController ()

@end

@implementation TodoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Todo List";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.todoTableView.delegate = self;
    self.todoTableView.dataSource = self;
    
    self.todoListArray = [[NSMutableArray alloc] init];
    [self.todoListArray addObject:@"Todo Item1"];
    [self.todoListArray addObject:@"added item"];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addTodoButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
    target:self
    action:@selector(addTodoItem)];
    
    self.navigationItem.rightBarButtonItem = addTodoButton;
    
    UINib *customNib = [UINib nibWithNibName:@"TodoCustomCell" bundle:nil];
    [self.todoTableView registerNib:customNib forCellReuseIdentifier:@"TodoCustomCell"];
}

- (void)addTodoItem {
    [self.todoListArray insertObject:@"" atIndex:0];
    [self.todoTableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    TodoCustomCell *cell = (TodoCustomCell *)[self.todoTableView cellForRowAtIndexPath:indexPath];
    [cell.textfieldNewTodoItem becomeFirstResponder];
}

-(void) todoEditingDone {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todoListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TodoCustomCell";
    TodoCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textfieldNewTodoItem.text = [self.todoListArray objectAtIndex:indexPath.row];
    
    cell.textfieldNewTodoItem.delegate = self;
    cell.textfieldNewTodoItem.tag = indexPath.row;

    return cell;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.todoListArray[textField.tag] = textField.text;
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.todoListArray[textField.tag] = textField.text;
    [self.view endEditing:YES];
    return YES;
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     // Delete the row from the data source
     [self.todoListArray removeObjectAtIndex:indexPath.row];
     [tableView reloadData];
     //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
 }

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:YES];
    [self.todoTableView setEditing:editing animated:YES];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSString *temp = self.todoListArray[fromIndexPath.row];
    self.todoListArray[fromIndexPath.row] = self.todoListArray[toIndexPath.row];
    self.todoListArray[toIndexPath.row] = temp;
}


@end
