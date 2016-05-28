//
//  AddViewController.m
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "AddViewController.h"


@interface AddViewController (){
    NSArray *employeeObjects;
}
@property (weak, nonatomic) NSString *temp1;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtFirstName.delegate = self;
    self.txtLastName.delegate = self;
    self.txtDepartment.delegate = self;
    self.txtPhoneNumber.delegate = self;
    
    if (delegate.isAddEmployee == YES){
        [self.btnDeleteEmployee setHidden:YES];
    }
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    if (delegate.isAddEmployee == YES){
        NSString *temp1 = [NSString stringWithFormat:@""];
        self.txtFirstName.text = [NSString stringWithString:temp1];
        self.txtLastName.text = [NSString stringWithString:temp1];
        self.txtDepartment.text = [NSString stringWithString:temp1];
        self.txtPhoneNumber.text = [NSString stringWithString:temp1];
    } else {
        self.txtFirstName.text = self.employeeDetails.firstName;
        self.txtLastName.text = self.employeeDetails.lastName;
        self.txtDepartment.text = self.employeeDetails.department;
        self.txtPhoneNumber.text = self.employeeDetails.phoneNumber;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)btnDeleteEmployeeClicked:(id)sender {
    // Check case when two employees have the same first name
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Are you sure you want to delete this employee's profile" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    //NSLog(@"The clicked button index is %ld",(long)buttonIndex);
    if (buttonIndex == 1){
        NSString *string = [NSString stringWithFormat:@"%@",self.txtPhoneNumber.text];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"phoneNumber = %@",string];
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EmployeeDetails"];
        request.predicate = predicate;
        NSArray *employees = [delegate.managedObjectContext executeFetchRequest:request error:nil];
        [delegate.managedObjectContext deleteObject:[employees objectAtIndex:0]];
        [delegate.managedObjectContext save:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)btnOKClicked:(id)sender {
    
    if ([self.txtFirstName.text isEqualToString:@""]
        || [self.txtLastName.text isEqualToString:@""]
        || [self.txtDepartment.text isEqualToString:@""]
        || [self.txtPhoneNumber.text isEqualToString:@""]){
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"All the fields are mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    else{
        if (delegate.isAddEmployee == YES){
    
            NSLog(@"Number as string is %@",self.txtPhoneNumber.text);
            NSLog(@"Number as int is %d",[self.txtPhoneNumber.text intValue]);
            NSLog(@"Number as int is %ld",[self.txtPhoneNumber.text integerValue]);
            EmployeeDetails *employeeDetails = [NSEntityDescription insertNewObjectForEntityForName:@"EmployeeDetails" inManagedObjectContext:delegate.managedObjectContext];
            [employeeDetails setFirstName:self.txtFirstName.text];
            [employeeDetails setLastName:self.txtLastName.text];
            [employeeDetails setDepartment:self.txtDepartment.text];
            [employeeDetails setPhoneNumber:self.txtPhoneNumber.text];
            NSError *error = nil;
            [delegate.managedObjectContext save:&error];
            if (error){
                NSLog(@"Sorry! Failed to save %@",error.localizedDescription);
            }
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            //write code to update employee details
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"phoneNumber = %@",self.txtPhoneNumber.text];
            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EmployeeDetails"];
            request.predicate = predicate;
            employeeObjects = [delegate.managedObjectContext executeFetchRequest:request error:nil];
            [[employeeObjects objectAtIndex:0] setFirstName:self.txtFirstName.text];
            [[employeeObjects objectAtIndex:0] setLastName:self.txtLastName.text];
            [[employeeObjects objectAtIndex:0] setDepartment:self.txtDepartment.text];
            [[employeeObjects objectAtIndex:0] setPhoneNumber:self.txtPhoneNumber.text];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}

- (IBAction)btnCancelClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField;{
    [self.txtFirstName resignFirstResponder];
    [self.txtLastName resignFirstResponder];
    [self.txtDepartment resignFirstResponder];
    [self.txtPhoneNumber resignFirstResponder];
}
@end
