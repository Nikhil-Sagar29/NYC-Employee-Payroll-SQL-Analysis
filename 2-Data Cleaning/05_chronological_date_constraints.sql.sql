                                05 - Chronological Date Constraints

-- 1. Diagnostic Audit: Trace impossible future start dates relative to the reporting fiscal cycle
                                  
Select 
	Fiscal_year,
	agency_start_date,
	Payroll_number, 
  Full_name, 
	Title_description, 
	Regular_gross_paid
From payroll_info
Where 
  Extract(year From Agency_start_date)  > Fiscal_year
And agency_start_date <> '9999-12-31'
Order by 
  fiscal_year desc,
  Agency_start_date desc

-- 2. Data Transformation Step A: Nullify the infinite "end of time" system placeholder date

Update Payroll_info
Set agency_Start_date = null
Where Agency_start_date = '9999-12-31'

-- 3. Diagnostic Audit: Trace extreme historic career tenures to catch unrealistic hire milestones

Select 
	Fiscal_year,
	Agency_start_date,
  Full_name 
from payroll_info	
Where Extract(year from Agency_start_date) < 1950
Order by extract(year from Agency_start_date) 

-- 4. Data Transformation Step B: Nullify the 1901-01-01 legacy database import migration glitch

Update Payroll_info
Set Agency_start_date = null
Where Agency_start_date = '1901-01-01'









