                                            08 - Payroll key and Duplicate Auditing

-- 1. Diagnostic Audit: Quantify missing records in primary categorical department keys
Select
	Payroll_number,
	Count(*) as Null_values
from Payroll_info
Where Payroll_number is NUll
Group by Payroll_number

-- 2. Data Transformation: Convert missing keys to an administrative '0' fallback marker
Update payroll_info
Set payroll_number = 0
Where Payroll_number is null

-- 3. Diagnostic Audit: Run a career-split evaluation to identify identical rows within the same fiscal cycle
Select 
	Fiscal_year,
	Payroll_number,
	Full_name,
	Agency_name,
	Title_description,
	Count(*) as total_duplicates
from payroll_info
Group by 
  fiscal_year,
  payroll_number, 
  full_name,
  agency_name,
  title_description
Having count(*) > 1
Order by total_duplicates desc


