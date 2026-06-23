                              04 - Name Standardization Shortcuts

-- 1. Schema Modification: Add permanent full name shortcut field\
Alter table Payroll_info
Add Column Full_name Varchar(200)

-- 2. Data Transformation Step A: Strip garbage punctuation and merge names

Update payroll_info
	Set Full_name = 
			Case
		  	When Trim(concat(first_name,mid_init,last_name)) = ' ' 
        then 'Unknown Name'
			Else (
			  Trim(Regexp_replace(
  			Concat(
  				RegeXP_replace(first_name,'^[\s\.\-]+', '', 'g'), ' ',
  				RegeXP_replace(mid_init,'^[\s\.\-]+', '', 'g'), ' ',
  				RegeXP_replace(last_name,'^[\s\.\-]+', '', 'g'), ' '
  			),
  			
  			'\s+', ' ','g'
  			
  			))
			End
                                
-- 3. Data Transformation Step B: Flatten empty space strings into 'Unknown Name'
Update payroll_info 
Set full_name = 'Unknown Name'
Where  TRIM(full_name) = '' 
Or full_name Is Null




