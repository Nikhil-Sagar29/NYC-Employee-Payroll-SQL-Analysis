                              04 - Union Contract Shocks & Back-Pay Clusters

-- Isolate and quantify macro-level financial spikes caused by delayed union wage settlements

Select
	Fiscal_year,
	Agency_name,
	Title_description,
	Count(*) As Employees_recieving_backpay,
	Round(Avg(Base_salary),2) As Average_contract_payout,
	Round(Avg(regular_gross_paid),2) As Average_inflated_payout,
	Round(sum(Regular_gross_paid - Base_salary),2) as Total_union_contract_shock_dollars
From payroll_info
Where 
	Compliance_flag = 'Operational: High Salary Deviation'
	And Regular_gross_paid > Base_salary
Group by Fiscal_year,Agency_name,title_description
Order by total_union_contract_shock_dollars desc
limit 10
