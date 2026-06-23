                                  02 - The Overwork & Personnel Burnout Matrix

-- Calculate the exact percentage ratio of overtime spending relative to standard base pay

Select 
	Agency_name, 
	Sum(Regular_gross_paid) as Normal_pay_Spending,
	Sum(Total_ot_paid) As Overtime_pay_spending,
	Round((Sum(total_ot_paid) / Nullif(Sum(Regular_gross_paid),0)) * 100,2) as Overtime_Share_percentage
From Payroll_info
Where Workforce_track = 'Full time salaried Workforce'
Group by Agency_name
Order by Overtime_share_percentage desc
