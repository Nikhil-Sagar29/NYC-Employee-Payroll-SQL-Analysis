                                          01 - Rate and Logic Validation

-- 1. Initial Diagnostic Audit: Locate logic violations
                                            
Select 
    Regular_hours, 
    Regular_gross_paid
from Payroll_info
where 
    (regular_hours = 0 or regular_hours is null) 
    And regular_gross_paid > 0

-- 2. Schema Modification: Add structural tracking column
                                      
Alter Table Payroll_info 
Add column Hours_logic_status varchar(50)
Default 'Standard Hours Logged'

-- 3. Data Transformation: Categorize zero-hour payouts
                                            
Update Payroll_info
Set Hours_logic_status = 'Zero hours with Positive Pay'
Where (Regular_hours = 0 or regular_hours is NULL)
and Regular_gross_paid>0

-- 4. Verification Track A: View standard hourly workforce
                                            
Select * from payroll_info
where Hours_logic_status = 'Standard Hours Logged'

-- 5. Verification Track B: View salaried/separation workforce
                                            
Select * from Payroll_info
Where Hours_logic_status = 'Zero hours with Positive Pay'











