//
//  SearchViewController.m
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 26/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController (){
    NSString *searchKey;
    NSArray *employees;
    int rowIndex;
}

@property (strong, nonatomic) NSString *tmp;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtSearchBy.delegate = self;
    [self addPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addPickerView{
    pickerArray = [[NSArray alloc]initWithObjects:@"First Name",
                   @"Last Name",@"Department",@"Phone Number", nil];

    
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -  100, self.view.frame.size.width, 100)];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleDefault];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.txtSearchBy.inputView = myPickerView;
    self.txtSearchBy.inputAccessoryView = toolBar;
    
}


#pragma mark - Text field delegates

-(void) textFieldDidEndEditing:(UITextField *)textField{
    [self.txtSearchBy resignFirstResponder];
    [self.txtSearchBy setText:[pickerArray objectAtIndex:rowIndex]];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
        
    }
}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}



-(void) done: (id) sender {
    NSLog(@"Done clicked");
    [self.txtSearchBy setText:[self pickerView:myPickerView titleForRow:rowIndex forComponent:1]];
    [self.txtSearchBy resignFirstResponder];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [self.txtSearchBy setText:[pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    
    rowIndex = (int)row;
    return [pickerArray objectAtIndex:row];
    
}




//- (IBAction)showSearchOptions:(id)sender {
//}

- (IBAction)btnSearchEmployeeClicked:(id)sender {
    
    searchKey = [NSString stringWithString:self.barSearch.text];
    
    NSPredicate *predicate;
    
    if ([self.txtSearchBy.text isEqualToString:@"First Name"]){
        predicate = [NSPredicate predicateWithFormat:@"firstName contains %@",searchKey];
    }
    else if ([self.txtSearchBy.text isEqualToString:@"Last Name"]){
        predicate = [NSPredicate predicateWithFormat:@"lastName contains %@",searchKey];
    }
    else if ([self.txtSearchBy.text isEqualToString:@"Department"]){
        predicate = [NSPredicate predicateWithFormat:@"department contains %@",searchKey];
    }
    else if ([self.txtSearchBy.text isEqualToString:@"Phone Number"]){
        predicate = [NSPredicate predicateWithFormat:@"phoneNumber contains %@",searchKey];
    }
        
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"EmployeeDetails"];
    request.predicate = predicate;
    employees = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    
    delegate.isAddEmployee = NO;
    [self performSegueWithIdentifier:@"showSearchedEmployeeDetails" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddViewController *addViewController = [segue destinationViewController];
    addViewController.employeeDetails = [employees objectAtIndex:0];
}

- (IBAction)btnClearClicked:(id)sender {
    [self.txtSearchBy setText:@""];
    [self.barSearch setText:@""];
}

- (IBAction)btnCancelClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
