USE ZooDB;


-- For each visitor,find first name and last name of visitor and the total amount they need to pay. 
SELECT visitor.first_name,visitor.last_name,receipt.total
FROM visitor
JOIN receipt
WHERE visitor_id = view_permission_id;


-- For each employee, find the email of employee who has the permission to edit animal record
SELECT employee_account.emp_id
FROM employee_account
WHERE employee_account.acc_id IN (
	SELECT employee_permission.emp_acc_id
	FROM employee_permission
	WHERE employee_permission.edit_animal_record = 1
);

-- For each employee, find the first name, last name and their total work hours
SELECT employee.emp_id,employee.first_name,employee.last_name, time_sheet.total_hours
FROM employee
JOIN time_sheet
WHERE employee.emp_id = time_sheet.emp_id;

-- total hours group by employee id
SELECT SUM(total_hours), emp_id
FROM time_sheet
GROUP BY emp_id;

-- find employee id and their permission id,  join by employee first name
SELECT employee_account.emp_id, employee_account.permission_id, employee.first_name
FROM employee_account
 JOIN employee
ON employee.emp_id = employee_account.emp_id;

-- Find the receipt id that bought 2 or more adult tickets
SELECT receipt.receipt_id, receipt.total
FROM receipt
WHERE receipt.num_adult_ticket >= 2;

-- view the total sum of all zoo expenses with the manager id
SELECT SUM(cost) AS total_expense, employee.emp_id AS View_By
FROM zoo_expense
JOIN employee
WHERE employee.emp_id = 1001
GROUP BY zoo_expense.expense_id;


-- Update the payment info and dispaly the name of person edited 
UPDATE payment_info
SET payment_info.debit = '1346432167'
WHERE payment_info.visitor_permission_id = 801;



