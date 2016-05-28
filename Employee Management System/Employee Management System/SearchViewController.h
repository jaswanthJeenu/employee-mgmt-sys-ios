//
//  SearchViewController.h
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AddViewController.h"

@interface SearchViewController : BaseViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
    
    UITextField *myTextField;
    UIPickerView *myPickerView;
    NSArray *pickerArray;
}

@property (weak, nonatomic) IBOutlet UILabel *lblSearchBy;
@property (weak, nonatomic) IBOutlet UILabel *lblSearchValue;
@property (weak, nonatomic) IBOutlet UIButton *btnSearchEmployee;
@property (weak, nonatomic) IBOutlet UITextField *txtSearchBy;


@property (weak, nonatomic) IBOutlet UISearchBar *barSearch;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnClear;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
//- (IBAction)showSearchOptions:(id)sender;

- (IBAction)btnSearchEmployeeClicked:(id)sender;
- (IBAction)btnClearClicked:(id)sender;
- (IBAction)btnCancelClicked:(id)sender;




@end
