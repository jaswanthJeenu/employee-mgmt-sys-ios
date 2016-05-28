//
//  OptionsViewController.h
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface OptionsViewController : BaseViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnAddEmployee;
@property (weak, nonatomic) IBOutlet UIButton *btnSeeAllEmployees;
@property (weak, nonatomic) IBOutlet UIButton *btnSearchEmployee;
@property (weak, nonatomic) IBOutlet UIButton *btnDeleteAllEmployees;

- (IBAction)btnAddEmployeeClicked:(id)sender;
- (IBAction)btnSeeAllEmployeesClicked:(id)sender;
- (IBAction)btnSearchEmployeeClicked:(id)sender;
- (IBAction)btnDeleteAllEmployeesClicked:(id)sender;



@end
