-- Script name: insets.sql
-- Author: 		Nyan Ye Lin
-- Purpose:		insert sample data to test the integrity of this database system

-- the database used to insert the data into
USE ZooDB;

-- food table inserts
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('10', 'beef', 'high', '2023-01-30', '2023-02-01', '2022-05-01 13:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('11', 'corn', 'high', '2023-02-28', '2023-03-01', '2022-06-01 14:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('12', 'banana', 'high', '2023-03-30', '2023-04-01', '2022-07-01 15:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('13', 'vegetables', 'high', '2023-04-30', '2023-05-01', '2022-08-01 16:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('14', 'chicken', 'high', '2023-05-30', '2023-06-01', '2022-09-01 17:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('15', 'ground beef', 'low', '2023-01-30', '2022-12-01', '2022-10-01 18:23:44');
INSERT INTO `ZooDB`.`food_supply` (`food_supply_id`, `supply_name`, `amount(low/high)`, `expiration_date`, `future_delivery_date`, `last_updated`) VALUES ('16', 'ground chicken', 'low', '2023-01-30', '2022-11-01', '2022-05-01 18:23:44');

-- ticket table inserts
INSERT INTO `ZooDB`.`ticket` (`ticket_id`, `ticket_type`, `price`) VALUES ('30', 'adult', '75');
INSERT INTO `ZooDB`.`ticket` (`ticket_id`, `ticket_type`, `price`) VALUES ('31', 'child', '45');

-- animal table inserts
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('1', 'lion', '10', '101');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('2', 'monkey', '12', '102');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('3', 'zebra', '13', '103');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('4', 'elephant', '11', '104');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('5', 'cheetah', '10', '105');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('6', 'rino', '13', '106');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('7', 'rabbit', '13', '107');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('8', 'wolf', '14', '108');
INSERT INTO `ZooDB`.`animal` (`animal_id`, `animal_type`, `food`, `medical_id`) VALUES ('9', 'giraffe', '13', '109');


-- medical supply inserts
INSERT INTO `ZooDB`.`medical_supply` (`medical_supply_id`, `supply_name`, `expiration_date`, `future_delivery_date`) VALUES ('20', 'vitamins', '2023-03-30', '2024-03-30');
INSERT INTO `ZooDB`.`medical_supply` (`medical_supply_id`, `supply_name`, `expiration_date`, `future_delivery_date`) VALUES ('21', 'supplements', '2023-04-30', '2024-04-30');
INSERT INTO `ZooDB`.`medical_supply` (`medical_supply_id`, `supply_name`, `expiration_date`, `future_delivery_date`) VALUES ('22', 'cold medicine', '2023-05-30', '2024-05-30');
INSERT INTO `ZooDB`.`medical_supply` (`medical_supply_id`, `supply_name`, `expiration_date`, `future_delivery_date`) VALUES ('23', 'flu medicine', '2023-06-30', '2024-06-30');
INSERT INTO `ZooDB`.`medical_supply` (`medical_supply_id`, `supply_name`, `expiration_date`, `future_delivery_date`) VALUES ('24', 'antibiotics', '2023-07-30', '2024-07-30');

-- medical record inserts
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('101', '1', 'antibiotic', 'infection', '2022-05-30', 'John');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('102', '2', 'vitamins', 'cold', '2022-06-30', 'James ');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('103', '3', 'none', 'none', '2022-07-30', 'James');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('104', '4', 'none', 'none', '2022-07-30', 'James');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('105', '5', 'none', 'none', '2022-07-30', 'Susan');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('106', '6', 'vitamins', 'none', '2022-08-30', 'Susan');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('107', '7', 'none', 'none', '2022-09-30', 'Susan');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`, `veterinarian_name`) VALUES ('108', '8', 'anitbiotic', 'infection', '2022-10-30', 'Kevin');
INSERT INTO `ZooDB`.`medical_record` (`medical_id`, `animal`, `medicine`, `medical_condition`, `last_checkup`,`veterinarian_name`) VALUES ('109', '9', 'supplements', 'none', '2022-11-30','Kevin');


-- employee table inserts
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`) VALUES ('1001', 'David', 'Wallace', 'wallace@mail.com', '200', '100000');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`) VALUES ('1002', 'Jan ', 'Levision', 'levision@mail.com', '201', '100000');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`) VALUES ('1003', 'Michael', 'Scott', 'scott@mail.com', '202', '100000');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1004', 'Angela', 'Martin', 'martin@mail.com', '202', '60000', '1003');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1005', 'Kelly', 'Kapoor', 'kapoor@mail.com', '202', '60000', '1003');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1006', 'Stanly', 'Hudson', 'hudson@mail.com', '202', '70000', '1003');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1007', 'Jim', 'Halpert', 'halpert@mail.com', '201', '70000', '1002');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1008', 'Josh', 'Poter', 'poter@mail.com', '201', '75000', '1002');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1009', 'James', 'smith', 'smith@mail.com', '201', '75000', '1002');
INSERT INTO `ZooDB`.`employee` (`emp_id`, `first_name`, `last_name`, `email`, `department`, `salary`, `super_id`) VALUES ('1010', 'John', 'Doe', 'doe@mail.com', '200', '80000', '1001');

-- department table insert
INSERT INTO `ZooDB`.`department` (`department_id`, `department_name`, `manager`) VALUES ('200', 'zoo managing', '1001');
INSERT INTO `ZooDB`.`department` (`department_id`, `department_name`, `manager`) VALUES ('201', 'zoo keeping', '1002');
INSERT INTO `ZooDB`.`department` (`department_id`, `department_name`, `manager`) VALUES ('202', 'customer service', '1003');


-- employee account inserts
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('401', '1001', '501');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('402', '1002', '502');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('403', '1003', '503');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('404', '1004', '504');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('405', '1005', '505');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('406', '1006', '506');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('407', '1007', '507');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('408', '1008', '508');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('409', '1009', '509');
INSERT INTO `ZooDB`.`employee_account` (`acc_id`, `emp_id`, `permission_id`) VALUES ('410', '1010', '510');


-- employee permission table inserts
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('501', '401', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('502', '402', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('503', '403', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('504', '404', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('505', '405', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('506', '406', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('507', '407', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('508', '408', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('509', '409', '1', '0', '1', '0', '1', '0', '0', '1', '0');
INSERT INTO `ZooDB`.`employee_permission` (`permisson_id`, `emp_acc_id`, `view_animal_record`, `edit_animal_record`, `view_medical_record`, `edit_medical_record`, `view_timesheet`, `edit_timeshseet`, `edit_ticket_price`, `view_zoo_expense`, `edit_zoo_expense`) VALUES ('510', '410', '1', '0', '1', '0', '1', '0', '0', '1', '0');


-- time sheet table inserts
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1001', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1002', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1003', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1004', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1005', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1006', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1007', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1008', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1009', '2022-01-01', '09:00:00', '17:00:00', '8');
INSERT INTO `ZooDB`.`time_sheet` (`emp_id`, `date`, `start_at`, `end_at`, `total_hours`) VALUES ('1010', '2022-01-01', '09:00:00', '17:00:00', '8');


-- visitor table inserts
INSERT INTO `ZooDB`.`visitor` (`visitor_id`, `email`, `first_name`, `last_name`) VALUES ('2001', 'parker@mail.com', 'Peter', 'Parker');
INSERT INTO `ZooDB`.`visitor` (`visitor_id`, `email`, `first_name`, `last_name`) VALUES ('2002', 'jane@mail.com', 'Mary', 'Jane');
INSERT INTO `ZooDB`.`visitor` (`visitor_id`, `email`, `first_name`, `last_name`) VALUES ('2003', 'potter@mai.com', 'Harry', 'Potter');
INSERT INTO `ZooDB`.`visitor` (`visitor_id`, `email`, `first_name`, `last_name`) VALUES ('2004', 'kane@mail.com', 'Kevin', 'Kane');


-- visitor account insert
INSERT INTO `ZooDB`.`visitor_account` (`acc_id`, `visitor_id`, `receipt`, `payment_id`) VALUES ('601', '2001', '701', '801');
INSERT INTO `ZooDB`.`visitor_account` (`acc_id`, `visitor_id`, `receipt`, `payment_id`) VALUES ('602', '2002', '702', '802');
INSERT INTO `ZooDB`.`visitor_account` (`acc_id`, `visitor_id`, `receipt`, `payment_id`) VALUES ('603', '2003', '703', '803');
INSERT INTO `ZooDB`.`visitor_account` (`acc_id`, `visitor_id`, `receipt`, `payment_id`) VALUES ('604', '2004', '704', '804');

-- payment info table insert
INSERT INTO `ZooDB`.`payment_info` (`payment_id`, `visitor_permission_id`, `debit`, `credit`) VALUES ('801', '2001', '46461646164', '6464664616');
INSERT INTO `ZooDB`.`payment_info` (`payment_id`, `visitor_permission_id`, `debit`, `credit`) VALUES ('802', '2002', '49846194616', '4646164644');
INSERT INTO `ZooDB`.`payment_info` (`payment_id`, `visitor_permission_id`, `debit`, `credit`) VALUES ('803', '2003', '67871346784', '6846134645');
INSERT INTO `ZooDB`.`payment_info` (`payment_id`, `visitor_permission_id`, `debit`, `credit`) VALUES ('804', '2004', '76516484468', '8489451684');

-- receipt table insert
INSERT INTO `ZooDB`.`receipt` (`receipt_id`, `view_permission_id`, `num_adult_ticket`, `num_child_ticket`, `total`, `payment`, `refundable`) VALUES ('701', '2001', '1', '2', '165', '801', '1');
INSERT INTO `ZooDB`.`receipt` (`receipt_id`, `view_permission_id`, `num_adult_ticket`, `num_child_ticket`, `total`, `payment`, `refundable`) VALUES ('702', '2002', '2', '1', '195', '802', '1');
INSERT INTO `ZooDB`.`receipt` (`receipt_id`, `view_permission_id`, `num_adult_ticket`, `num_child_ticket`, `total`, `payment`, `refundable`) VALUES ('703', '2003', '1', '2', '165', '803', '1');
INSERT INTO `ZooDB`.`receipt` (`receipt_id`, `view_permission_id`, `num_adult_ticket`, `num_child_ticket`, `total`, `payment`, `refundable`) VALUES ('704', '2004', '2', '1', '195', '804', '1');

-- zoo expneses insert

INSERT INTO `ZooDB`.`zoo_expense` (`expense_id`, `expense_type`, `date`, `cost`) VALUES ('7001', 'medicine', '2022-05-01', '2000');
INSERT INTO `ZooDB`.`zoo_expense` (`expense_id`, `expense_type`, `date`, `cost`) VALUES ('7002', 'food', '2022-06-01', '4000');
INSERT INTO `ZooDB`.`zoo_expense` (`expense_id`, `expense_type`, `date`, `cost`) VALUES ('7003', 'zoo upgrade', '2022-07-01', '5000');




