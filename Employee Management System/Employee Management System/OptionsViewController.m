//
//  OptionsViewController.m
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnAddEmployeeClicked:(id)sender {
    delegate.isAddEmployee = YES;
}

- (IBAction)btnSeeAllEmployeesClicked:(id)sender {
}

- (IBAction)btnSearchEmployeeClicked:(id)sender {
}

- (IBAction)btnDeleteAllEmployeesClicked:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Are you sure you want to delete the profiles of all employees" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    //NSLog(@"The clicked button index is %ld",(long)buttonIndex);
    if (buttonIndex == 1){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EmployeeDetails"];
        NSArray *employees = [delegate.managedObjectContext executeFetchRequest:request error:nil];
        int i;
        for (i = 0;i < employees.count;i++){
            [delegate.managedObjectContext deleteObject:[employees objectAtIndex:i]];
        }
        [delegate.managedObjectContext save:nil];
    }
}

@end
