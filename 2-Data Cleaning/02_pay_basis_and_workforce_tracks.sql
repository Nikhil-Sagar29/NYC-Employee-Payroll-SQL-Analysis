                                      02 - Pay Basis and Workforce Tracks

-- 1. Diagnostic Audit: Track Pay Basis vs. Rate mismatches and token structures
                                        
Select 
	Fiscal_year,
	payroll_number,
	agency_name,
	title_description, 
	pay_basis,
	base_salary,
	regular_hours,
	Regular_gross_paid,
	Case
		When Base_salary = 1.00 
      Then 'Valid Token'
		When Title_description LIke '%Custodian Engineer%' And Pay_basis ='Per Hour' and Regular_hours = 0
		  Then 'Specialized Budget Pay track'
		When pay_basis in ('Per Annum', 'Prorated Annual') And Base_salary < 5000
		  Then 'Error: Low Base Salary for annual basis'
		When pay_basis = 'Per Hour' And Base_salary > 500
		  Then 'Error: High base Salary for Hourly basis'
 		Else 'Clean'
		End as Basis_Validation_status
from payroll_info
Where
		Base_salary = 1.00
		or (Pay_basis in ('Per Annum','Prorated Annual') And Base_Salary < 5000)
		Or (Pay_basis = 'Per Hour' And Base_salary > 500)

-- 2. Schema Modification: Add structural group column
Alter table payroll_info
Add column Workforce_track varchar(50)

-- 3. Data Transformation: Macro behavioral classification
Update payroll_info
	Set Workforce_track = 
				Case
  				When Base_salary = 1.00
            Then 'Stipend/token record'
  				When pay_basis = 'Per Hour' and Base_salary > 500 and (Regular_hours = 0 or regular_hours is null)
  				  Then 'Special Budgetary track'
  				When pay_basis = 'Per_hour' and Base_salary <=100
  				  Then 'Hourly / Variable workforce'
  				When Pay_basis in ('Per Annum', 'Prorated Annual') and Base_Salary >=5000
  				  Then 'Full time salaried Workforce'
				Else 'Unclassified / Audit Required'
				End

-- 4. Quality Verification Count
Select
   workforce_track, 
   Count(*)
From payroll_info
group by 
   workforce_track









