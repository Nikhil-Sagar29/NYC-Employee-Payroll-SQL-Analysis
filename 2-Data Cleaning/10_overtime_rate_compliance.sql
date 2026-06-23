                                    10 - Overtime Rate Compliance

-- 1. Diagnostic Audit: Identify records failing standard statutory labor rate multipliers

Select
	Full_name,
	title_description,
	Base_salary,
	Regular_hours,
	Regular_gross_paid,
	ot_hours,
	total_ot_paid,
	Round(Regular_gross_paid / Nullif(Regular_hours,0),2) As Calculated_regular_rate,
	Round(Total_ot_paid / nullif(ot_hours,0),2) as Calculated_ot_rate
from Payroll_info
where 
	Ot_hours > 10
	And Regular_hours > 10
	And (Total_ot_paid / Nullif(ot_hours,0)) <= (Regular_gross_paid / Nullif(Regular_hours,0))
order by calculated_regular_rate desc	

-- 2. Data Transformation: Permanently tag systematic underpayment anomalies for compliance reviews

Update Payroll_info
Set Compliance_flag = 'Labor Audit: Sub Standard Overtime Rate'
Where 	
	Ot_hours > 10
	And Regular_hours > 10
	And (Total_ot_paid / Nullif(ot_hours,0)) <= (Regular_gross_paid / Nullif(Regular_hours,0))






