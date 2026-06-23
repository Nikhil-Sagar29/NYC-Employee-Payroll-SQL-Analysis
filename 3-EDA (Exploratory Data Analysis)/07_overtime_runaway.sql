                                    07 - Overtime Runaway & Budgetary Momentum Tracker

-- Track multi-year velocity spending thresholds to capture collapsing agency schedule structures

Select 
	Fiscal_year,
	agency_name,
	Round(sum(regular_gross_paid),2) as Standard_base_spend, 
	Round(sum(total_ot_paid),2) as Overtime_premium_spend,
	Round((sum(Total_ot_paid) / nullif(sum(regular_gross_paid),0)) * 100,2) as ot_to_regular_ratio_pct
from Payroll_info
Where Workforce_track = 'Full time salaried Workforce'
Group by Fiscal_year,agency_name
Having (Sum(total_ot_paid) / Nullif(sum(regular_gross_paid),0)) * 100 > 25.00
order by Fiscal_year desc, ot_to_regular_ratio_pct desc
