# 🛠️ Phase 1: Data Cleaning & Schema Standardization

This folder contains the complete 9-part data cleaning and validation pipeline executed to transform raw NYC payroll data into a structured, audit-ready data warehouse layer.

---

## 1️⃣ Base Pay & Work Hour Logic Violations
*   **Objective**: Diagnose and isolate logical system violations where employees are generated positive paycheck funds despite logging zero or missing standard work hours.
*   **SQL Code File**: [`01_rate_and_logic_validation.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/01_rate_and_logic_validation.sql)
*   **Issues Pointed In This Data/Code**: 
    *   Initial `WHERE` clause logic lacked proper brackets around the `OR` statements, causing the query filter to process criteria out of order and miss data rows. 
    *   Over 3.6 Million rows returned zero hours with active gross pay. Treating these raw rows as standard errors would break downstream hourly wage calculations with "divide-by-zero" crashes.
*   **Updates and Alteration Code**: Engineered a permanent categorical tracking column (`Hours_logic_status`) initialized with a `'Standard Hours Logged'` baseline. Applied a targeted `UPDATE` script to cleanly partition the 3.6M zero-hour profiles into a specialized salaried or separation track.
*   **After Changes**: The core hourly workforce is cleanly separated from fixed salaried lines. Analytical dashboard tools can now calculate average work hours or true hourly pay distributions without zero-hour profiles distorting the organizational baselines.

---

## 2️⃣ Pay Basis vs. Rate Range Mismatches
*   **Objective**: Audit contracted compensation fields to catch structural system errors where standard hourly employees are given annual tags, or annual executive brackets contain low single-digit data.
*   **SQL Code File**: [`02_pay_basis_and_workforce_tracks.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/02_pay_basis_and_workforce_tracks.sql)
*   **Issues Pointed In This Data/Code**: 
    *   Valid token stipends of $1.00 for board officials were triggering false positives.
    *   Specialized Custodian Engineers pulling $119k+ budgets with 0 hours logged were hiding inside hourly binned tracking locations.
*   **Updates and Alteration Code**: Engineered a new `Workforce_track` column. Used a behavioral logic matrix to segment millions of records automatically based on pay type and numeric boundaries rather than building brittle text-matching lists.
*   **After Changes**: Core career staff are separated from temporary, variable, or budget-heavy tracks, preserving the stability of downstream operational salary averages and preventing automated rate calculations from breaking.

---

## 3️⃣ Suspicious Overtime Policy Auditing
*   **Objective**: Audit timecards for a critical labor compliance issue: employees claiming premium overtime pay during cycles where their standard regular hours are exactly zero.
*   **SQL Code File**: [`03_suspicious_overtime_audit.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/03_suspicious_overtime_audit.sql)
*   **Issues Pointed In This Data/Code**: The initial diagnostic `WHERE` clause mixed `AND` / `OR` statements without proper parentheses. This caused the query filters to run out of order, missing hundreds of valid rows.
*   **Updates and Alteration Code**: Added parentheses to secure the conditional boundaries. Added a new `Compliance_flag` track initialized as 'Compliant Record' and wrote an update script to tag the 517 employee profiles bypassing regular hours.
*   **After Changes**: These risk lines are securely isolated under a dedicated compliance label. You can now present an actionable anti-fraud discovery to management showing exactly where scheduling internal controls are failing.

---

## 4️⃣ Wildcard Names & Character Standardization
*   **Objective**: Strip rogue system punctuation from employee names, collapse hidden variable white spaces, and construct a clean, permanent shortcut tracking identity column.
*   **SQL Code File**: [`04_name_standardization_shortcut.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/04_name_standardization_shortcut.sql)
*   **Issues Pointed In This Data/Code**: User input errors left leading dots, dashes, and invisible white spaces inside name records (e.g. `- Kimora` or `. Manisha`). Additionally, checking for an empty space text string (`' '`) completely misses cells with multiple hidden spaces or raw null entries.
*   **Updates and Alteration Code**: Engineered a permanent `Full_name` text column. Used nested regular expression functions (`REGEXP_REPLACE`) to strip leading garbage punctuation characters and flatten multi-space strings. Added a second bulletproof `TRIM()` clean-up statement to capture all empty fields and assign them to a unified `'Unknown Name'` baseline.
*   **After Changes**: Rogue text formatting is completely corrected. The unified `Full_name` field is fully sanitized and ready to act as a clean, repeatable sorting layer across all upcoming reporting views without breaking character charts.

---

## 5️⃣ Time-Travel and Chronological Anomalies
*   **Objective**: Audit employee timelines to isolate chronological errors where a hire date occurs in a future century or predates realistic modern employment horizons.
*   **SQL Code File**: [`05_chronological_date_constraints.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/05_chronological_date_constraints.sql.sql)
*   **Issues Pointed In This Data/Code**: Identified over 500 rows pointing to `9999-12-31`. This is an enterprise system placeholder used when a contract has no finalized start date yet. Uncovered hundreds of profiles locked into `1901-01-01` showing zero hours worked, representing an automated system migration crash from legacy files. True working personnel hired in the mid-1940s were safely protected from the clean-up query.
*   **Updates and Alteration Code**: Run dedicated `UPDATE` statements targeting only the explicit `9999-12-31` and `1901-01-01` system placeholder bugs, converting them safely into neutral database `NULL` markers.
*   **After Changes**: Your timeline averages are fully protected from impossible data points. You can now track true career seniority patterns across the city without artificial default values distorting the history.

---

## 6️⃣ Dynamic Future Checks & Negative Bookkeeping Corrections
*   **Objective**: Audit structural value boundaries to flag records listing start dates past today's execution window, while isolating negative number transactions.
*   **SQL Code File**: [`06_negative_value_corrections.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/06_negative_value_corrections.sql)
*   **Issues Pointed In This Data/Code**: The conditional filter logic initially used <> NULL syntax which is a syntax bug that causes SQL engines to ignore rows; this was rewritten using explicit IS NOT NULL constraints. Over 16,000 entries returned negative hours and negative gross pay. This is a legitimate accounting practice called an overpayment clawback, used when HR takes back money paid out in error.
*   **Updates and Alteration Code**: Corrected the syntax parameters using clean boolean brackets. Applied a permanent update script to route all 16,272 negative rows into a separate bookkeeping category labeled as 'Payroll Correction' inside your engineered Compliance_flag column.
*   **After Changes**: Future timeline errors are fully neutralized. All negative accounting adjustments are cleanly cataloged under a safe tracking column, allowing reporting tools to filter them out instantly so they don't drag down normal salary averages.

---

## 7️⃣ Text & Categorical Standardization
*   **Objective**: Sanitize text fields across job titles and work locations to eliminate irregular casing, rogue punctuation, hidden spacing, and wildcard data-entry corruption.
*   **SQL Code File**: [`07_text_and_categorical_standardization.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/07_text_and_categorical_standardization.sql)
*   **Issues Pointed In This Data/Code**: System wildcard filters (`*`, `?`) were accidentally saved directly into text cells (e.g. `CLERK*`), breaking group counts. Replacing double spaces with a completely empty string (`''`) would accidentally crush words together (converting `CHIEF  ENGINEER` into `CHIEFENGINEER`). 
*   **Updates and Alteration Code**: Used explicit `REPLACE()` functions to strip rogue characters and standardized double spaces down to clean, single-space gaps. Blank or missing titles and boroughs were unified under an `'Unknown'` tracking label.
*   **After Changes**: Categorical text columns are clean and uniform. Bar charts and grouping models can now aggregate jobs or districts without spelling fragments splitting a single category into separate lines.

---

## 8️⃣ Key Auditing & Duplicate Evaluation
*   **Objective**: Patch empty data tracks in structural identification fields and scan for true duplicate profiles across identical fiscal cycles.
*   **SQL Code File**: [`08_payroll_key_and_duplicate_auditing.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/08_payroll_key_and_duplicate_auditing.sql)
*   **Issues Pointed In This Data/Code**: Database `NULL` values in categorical keys break dashboard slicers and sorting layers. Running a broad `GROUP BY` on names and titles revealed thousands of repeated rows within the same fiscal year.
*   **Updates and Alteration Code**: Converted missing `Payroll_number` values into a safe administrative `'0'` fallback marker. Conducted a career-split evaluation to confirm that these multi-row records represent separate contractual movements (like mid-year department changes or promotions) rather than database errors.
*   **After Changes**: Primary keys are complete and ready for database relationships. Career-split records are cleanly preserved to maintain accurate municipal expense counts.

---

## 9️⃣ Redacted Identity Masking
*   **Objective**: Audit and categorize massive blocks of unidentifiable employee records to protect sensitive public safety profiles from accidental deletion filters.
*   **SQL Code File**: [`09_redacted_identity_masking.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/09_redacted_identity_masking.sql)
*   **Issues Pointed In This Data/Code**: Over 65,000 profiles loaded with an `'Unknown Name'`. A simple cleaning filter might flag and purge these as duplicate rows, which would delete real payroll spending. Analysis proved these lines are clustered tightly in the Police Department and District Attorney offices.
*   **Updates and Alteration Code**: Completed the truncated filtering query into a robust, unified `CASE` statement. Permanently assigned these rows to a dedicated safety classification (`Redacted Identity (Security/Privacy Track)`), while routing high-level un-named administrators to an `Executive Track`.
*   **After Changes**: Anonymous profiles are safely categorized under a protected track. This shields their financial data from standard deletion scripts, allowing you to include their budgets in high-level department reviews.

---

## 🔟 Overtime Rate Compliance Violations (The Time-and-a-Half Audit)
*   **Objective**: Audit the system for critical labor compliance risks where calculated overtime hourly rates mathematically fall below standard regular hourly wages.
*   **SQL Code File**: [`10_overtime_rate_compliance.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/10_overtime_rate_compliance.sql)
*   **Issues Pointed In This Data/Code**: 
    *   Over 101,000 rows failed standard statutory time-and-a-half labor laws. 
    *   For **28,161 Police Officers**, their regular rate was calculated at $30.33, but their overtime rate *dropped* to $27.67. 
    *   This is an automated software math calculation glitch—not individual human error—affecting nearly **$299 Million** in overtime funds.
*   **Updates and Alteration Code**: Applied a targeted `UPDATE` script to permanently flag all 101,829 affected rows as `'Labor Audit: Sub Standard Overtime Rate'` inside your engineered `Compliance_flag` column.
*   **After Changes**: These high-risk lines are securely isolated. You can now present an actionable compliance discovery to management showing exactly where the payroll system exposes the organization to massive back-pay lawsuits and regulatory labor fines.

---

## ⑪ Contract vs. Gross Pay Deviations
*   **Objective**: Identify full-time salaried workers whose actual take-home regular gross pay drastically deviates from their official baseline contract salary by more than $20,000.
*   **SQL Code File**: [`11_gross_pay_deviations.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/2-Data%20Cleaning/11_gross_pay_deviations.sql)
*   **Issues Pointed In This Data/Code**: 
    *   Isolated **692,868 rows** with massive salary gaps. 
    *   The analysis exposed huge group clusters—like **12,092 separate Police Officers** and **2,078 Special Ed Teachers** hitting identical paycheck spikes in the exact same year, costing an extra **$504 Million** and **$57 Million**. 
    *   This group clustering mathematically confirms a massive, delayed union contract settlement rather than individual data corruption.
*   **Updates and Alteration Code**: Applied a permanent update script to route all 692k high-variance rows into a separate tracking category labeled as `'Operational: High Salary Deviation'` inside your engineered `Compliance_flag` column.
*   **After Changes**: Massive, one-time collective bargaining back-pay payouts are cleanly segregated. Downstream analytics tools can now filter these rows out to view the city's true, unskewed baseline cost growth year-over-year.

---

