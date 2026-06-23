                                 06 - The Missing Department Budget Leak

-- Audit unassigned budget tracks and missing agency profiles to contain hidden financial leakage

Select 
	Payroll_number,
	agency_name,
	Count(distinct(title_description)) as Unique_job_titles_left,
	Count(*) as Active_employees_lines,
	Round(sum(regular_gross_paid),2) as hidden_regular_spend,
	Round(sum(Total_ot_paid),2) as hidden_overtime_spend
From payroll_info
Where Payroll_number = 0
	or Agency_name in ('Unknown','Unassigned','')
	Or Payroll_number is NULL
Group by payroll_number, Agency_name
order by hidden_regular_spend desc
