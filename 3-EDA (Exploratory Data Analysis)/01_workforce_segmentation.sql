                                            01 - Workforce Segmentation Matrix

-- Aggregate global metrics across the engineered behavioral tracking categories

Select
	Workforce_track,
	Count(*) As total_employees,
	Round(avg(base_salary),2) as Average_contract_salary,
	Round(Avg(Regular_gross_paid),2) as Average_take_home_pay,
	Round(sum(Regular_gross_paid),2) as total_segment_spending_dollars
From Payroll_info
Group by workforce_track
Order by Total_segment_spending_dollars desc 

-- Verification: View all distinct, valid workforce tracks populated in the system

Select Distinct Workforce_track from Payroll_info


