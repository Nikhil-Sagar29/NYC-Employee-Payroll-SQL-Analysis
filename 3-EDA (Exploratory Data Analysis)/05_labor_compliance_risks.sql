                              05 - Systemic Software Math & Labor Law Compliance Risks

-- Uncover and rank systemic software failures where overtime hourly rates drop below regular pay

Select
	agency_name,
	Title_description,
	Count(*) as Total_overtime_rate_errors,
	Round(avg(regular_gross_paid / Nullif(Regular_hours,0)),2) as Average_regular_rate,
	Round(avg(total_ot_paid / Nullif(ot_hours,0)),2) as average_broken_ot_rate,
	Round(sum(total_ot_paid),2) as total_affected_overtime_dollars
From payroll_info
where
	Compliance_flag = 'Labor Audit: Sub Standard Overtime Rate'
Group by Agency_name,Title_description
Order by Total_overtime_rate_errors desc
limit 10
