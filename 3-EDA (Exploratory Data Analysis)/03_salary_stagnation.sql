                                      03 - The Loyalty Pay Stagnation Paradox

-- Evaluate internal salary compression gaps across historical employee service tenures

Select 
	Title_description,
	Case
  	When (Fiscal_year - Extract(Year from Agency_start_date)) >= 20 
      Then 'Veteran 20+ Years'
  	When (Fiscal_year - Extract(year from agency_start_date)) >= 10 
      Then 'Senior 10+ Years'
  	When (Fiscal_year - Extract(year from Agency_start_date)) >= 5 
      Then 'Mid-Level 5-9 years'
	Else 'Associate 0-4 Years'
	End as Experience_level,
	Count(*) as Total_employees,
	Round(avg(base_salary),2) as Average_Contract_salary,
	Round(Avg(Regular_gross_paid),2) as Average_take_home_pay
From Payroll_info 
Where pay_basis = 'Per Annum'
And base_salary > 0
And agency_start_date is not null
Group by 
	Title_description,
	Case
	When (Fiscal_year - Extract(Year from Agency_start_date)) >= 20 
    Then 'Veteran 20+ Years'
	When (Fiscal_year - Extract(year from agency_start_date)) >= 10 
    Then 'Senior 10+ Years'
	When (Fiscal_year - Extract(year from Agency_start_date)) >= 5 
    Then 'Mid-Level 5-9 years'
	Else 'Associate 0-4 Years'
	End
Order by title_description asc, average_contract_salary desc
