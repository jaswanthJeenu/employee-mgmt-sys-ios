//
//  AddViewController.h
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EmployeeDetails.h"


@interface AddViewController : BaseViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblDepartment;
@property (weak, nonatomic) IBOutlet UILabel *lblPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtDepartment;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNumber;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnOK;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnDeleteEmployee;

@property (strong, nonatomic) EmployeeDetails *employeeDetails;

- (IBAction)btnDeleteEmployeeClicked:(id)sender;
- (IBAction)btnOKClicked:(id)sender;
- (IBAction)btnCancelClicked:(id)sender;



@end
