                                    07 - Text and Categorical Standardization

-- 1. Diagnostic Audit: Identify casing, punctuation, and space anomalies in job titles
Select 
    Title_description as Raw_Title, 
    Lower(trim(Replace(title_description,'.',''))) as CLeaned_title,
	Count(*) as Row_count
from Payroll_info
Group by 
	Title_description
Order by  row_count desc

-- 2. Data Transformation Step A: Strip structural wildcards from cells

Update Payroll_info
Set Title_description = Replace(title_description,'*','')
Where Title_description Like '%*%'

Update Payroll_info
Set Title_description = Replace(title_description,'?','')
Where Title_description Like '%?%'

-- 3. Data Transformation Step B: Neutralize blank or empty job strings

Update Payroll_info            
Set Title_description = 'Unknown'
Where 
  title_description is NULL
  or Title_description = ''

-- 4. Data Transformation Step C: Collapse irregular internal double-spacing

Update Payroll_info
Set Title_description = Trim(replace(Title_description,'  ',''))
Where Title_description like '% %'

-- 5. Data Transformation Step D: Neutralize missing borough tracking locations
                                      
Update Payroll_info
Set Work_location_borough = 'Unknown'
Where 
    Trim(Work_location_borough) = ''
    or Work_location_borough is null

-- 6. Verification: View distinct sanitized work boroughs

Select 
  Distinct Work_location_borough 
from Payroll_issue


