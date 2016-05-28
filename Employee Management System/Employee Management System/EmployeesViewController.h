//
//  EmployeesViewController.h
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EmployeeDetails.h"
#import "AddViewController.h"

@interface EmployeesViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;

- (IBAction)btnBackClicked:(id)sender;


@end
