//
//  EmployeeDetails+CoreDataProperties.h
//  Employee Management System
//
//  Created by Jaswanth Jeenu on 27/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EmployeeDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *department;
@property (nullable, nonatomic, retain) NSString *phoneNumber;

@end

NS_ASSUME_NONNULL_END
