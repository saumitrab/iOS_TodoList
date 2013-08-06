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
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addTodoButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
    target:self
    action:@selector(addTodoItem)];
    
    self.navigationItem.rightBarButtonItem = addTodoButton;
    
    UINib *customNib = [UINib nibWithNibName:@"TodoCustomCell" bundle:nil];
    [self.todoTableView registerNib:customNib forCellReuseIdentifier:@"TodoCustomCell"];
}

- (void)addTodoItem {
    TodoCustomCell *newCustomCell = [[TodoCustomCell alloc] init];
    newCustomCell.textfieldNewTodoItem.text = @"test";
    [self.todoListArray insertObject:newCustomCell atIndex:0];
    [self.todoTableView reloadData];
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //[self.todoTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
 
    //TodoCustomCell *cell = (TodoCustomCell *)[self.todoTableView cellForRowAtIndexPath:0];
    //[cell becomeFirstResponder];
}

/*
- (void) updatedCellCustomCell:(TodoCustomCell *)customCell {
    NSString *todo = [[NSString alloc] initWithString:customCell.textfieldNewTodoItem.text];
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoCustomCell *customcell = (TodoCustomCell *)[self.todoTableView cellForRowAtIndexPath:indexPath];
    NSString *todo = [[NSString alloc] initWithString:customcell.textfieldNewTodoItem.text];
}
 */

-(void) todoEditingDone {
    //Hack: Update first cell info in data array
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-( void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self.navigationController pushViewController:[[TodoCustomCell alloc] init] animated:YES];
    
    //static NSString *CustomCellIdentifier = @"CustomCell";
    
    //TodoCustomCell *customCell = [[TodoCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
}
*/

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
    
    //cell.textfieldNewTodoItem.text = [self.todoListArray objectAtIndex:indexPath.row];
    
    return cell;
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
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     //TodoCustomCell *cell = (TodoCustomCell *)[self.todoTableView cellForRowAtIndexPath:indexPath];
     //NSString *todo = [[NSString alloc] initWithString:cell.textfieldNewTodoItem.text];
    }
 }


 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }

/*

 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
*/
 

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 
 */


@end
