                                      06 - Negative Value Corrections

-- 1. Diagnostic Audit: Run a combined constraint check for future execution dates and negative metrics

Select 
	Fiscal_year, 
	Agency_start_date,
	Payroll_number,
	Full_name,
	Base_salary,
	regular_hours,
	Regular_gross_paid,
	Case
		when Agency_start_date > Current_date and Agency_start_date is not NULL
	    Then 'Error: Future start date'
		When Base_salary < 0 
      Then 'Account Adjustment: Negative Base Salary'
		When Regular_hours < 0
      Then 'Account Adjustment: Negative Work hours'
		When Regular_gross_paid < 0
      Then 'Account Adjustment: Negative Gross paid'
	Else 'Clean'
	End As Chronological_and_value_status
	From Payroll_Info
where 
	(Agency_start_date > Current_date and Agency_start_date is not NULL)
	or Base_salary < 0
	or Regular_hours < 0
	or Regular_gross_paid < 0

-- 2. Data Transformation: Stamp negative financial clawbacks securely into your engineered flag layer

Update payroll_info
Set Compliance_flag = 'Payroll correction'
Where Regular_hours < 0 or Regular_gross_paid < 0


