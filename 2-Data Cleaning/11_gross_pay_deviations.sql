                                  11 - Gross Pay Deviations

-- 1. Diagnostic Audit: Isolate annual salaried profiles with extreme baseline tracking variances

Select 
	Fiscal_year,
	Full_name, 
	Title_description,
	base_salary,
	Regular_gross_paid,
	ABS(BAse_Salary-Regular_gross_paid) as Pay_variance
From Payroll_info
Where 
	Pay_basis = 'Per Annum'
	And ABS(Base_salary - Regular_gross_paid ) > 20000
Order by pay_variance desc

-- 2. Data Transformation: Separate macro-level collective bargaining contract spikes from normal trends

Update Payroll_info
Set Compliance_Flag = 'Operational: High Salary Deviation'
Where 
  Pay_basis = 'Per Annum'
	And ABS(Base_salary - Regular_gross_paid) > 20000
