//
//  EmployeesViewController.m
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "EmployeesViewController.h"

@interface EmployeesViewController (){
    int index;
}

@property (strong, nonatomic) NSArray *employees;

@end

@implementation EmployeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EmployeeDetails"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
    self.employees = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.employees.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"employee"];
    EmployeeDetails *employeeDetails = [self.employees objectAtIndex:indexPath.row];
    NSString *name = [NSString stringWithFormat:@"%@ %@",employeeDetails.firstName,employeeDetails.lastName];
    NSString *dept = employeeDetails.department;
    cell.textLabel.text = [NSString stringWithString:name];
    cell.detailTextLabel.text = [NSString stringWithString:dept];
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    delegate.isAddEmployee = NO;
    index = (int)indexPath.row;
    [self performSegueWithIdentifier:@"showEmployeeDetailsSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddViewController *addViewController = [segue destinationViewController];
    addViewController.employeeDetails = [self.employees objectAtIndex:index];
}

- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
