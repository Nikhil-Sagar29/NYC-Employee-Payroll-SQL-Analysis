                                      03 - Suspicious Overtime Audit

-- 1. Initial Diagnostic Audit: Identify Overtime claimed with zero regular hours
-- Note: Fixed parenthesis placement to correct initial logical filter precedence bug

Select 
	Payroll_number,
	Full_name, 
	Title_description,
	Regular_hours,
	ot_hours,
	Total_ot_paid
from Payroll_info
Where Ot_hours > 0
 and (Regular_hours = 0 or Regular_Hours is NULL)

-- 2. Schema Modification: Create compliance flags layer
Alter table Payroll_info
Add Column Compliance_flag Varchar(50)
Default 'Compliant Record'

-- 3. Data Transformation: Permanently tag the overtime policy breach
Update Payroll_info
Set Compliance_flag = 'Suspicious Overtime (Zero Regular Hours)'
Where Ot_hours > 0 
And (Regular_hours = 0 or Regular_hours is NULL)






