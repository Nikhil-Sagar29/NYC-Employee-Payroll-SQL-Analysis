                                        09 - Redacted Identity Masking

-- 1. Diagnostic Audit: Cluster employee lines with missing identities across department tracks
Select 
	agency_name, 
	Title_description,
	workforce_track,
	Count(*) as Total_employees,
	Avg(base_salary) as avg_salary
From payroll_info
where 
	full_name = 'Unknown Name'
Group by 
	agency_name, 
	Title_description,
	workforce_track
order by total desc 

-- 2. Data Transformation: Route masked security and official files out of duplicate categories
-- Note: Completed the truncated code safely into a unified operational casing array

Update Payroll_info
	Set Compliance_flag =
		Case
  		When 
        Agency_name Like '%Police%'
    		Or Agency_name Like '%District Attorney%'
    		Or Agency_name Like '%DA%'
    		Or Agency_name Like '%Correction%'
  		    Then 'Redacted Identity (Security/Privacy track)'

  		When 
  			Title_Description Like '%Commissioner%'
  			or Title_description like '%Judge%'
  			or Title_description Like '%Trustee%'
  			or Title_description Like '%Director%'
  			or Title_description Like '%Chief%'
  			or Title_description Like '%Administrator%'
  		    Then 'Redacted Identity (Executive/Official track)'

		Else 'Data Error: Missing Employee identity'
		End 
		where Full_name = 'Unknown Name'
