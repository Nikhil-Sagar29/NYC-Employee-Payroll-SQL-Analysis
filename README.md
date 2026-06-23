# 📊 Financial Audit Portfolio: NYC Employee Payroll Analysis

## 📌 Project Overview

This project approaches the multi-million-row NYC payroll database from the perspective of a **Senior Financial & Forensic Auditor**. It bypasses basic data summaries to expose systemic budget leaks, automated calculation glitches, and labor law compliance risks using pure SQL.

---

## 🏛️ Essential NYC Payroll Rules & Context

### To properly audit this data, one must understand the strict administrative and legal guidelines governing New York City public operations:

#### *   **The Overtime Multiplier Rule ("Time-and-a-Half")**:
    - By law, extra shifts must pay '1.5 times' the standard hourly rate. 
    - Overtime rates that fall equal to or below regular pay signal system calculation failures.

#### *   **Union Contract Shocks**: 
    - Delayed union contract settlements force the city to pay out years of back-pay all at once 
    on a single modern paycheck, creating massive, artificial single-year budget spikes.

#### *   **Identity Redaction Laws**: 
    - Names of undercover officers, investigators, and prosecutorial staff are blanked out for safety. 
    - These are real employees drawing real funds, not duplicate data errors.

#### *   **Specialized Budgetary Tracks**: 
    - Custodian Engineers receive entire school building maintenance budgets under their individual names, 
    causing them to show up with massive annual payouts but `0.00` work hours.

#### *   **Payroll Corrections**:
    - Overpayments are corrected by processing negative dollar transactions on later paychecks to automatically
    lower year-to-date taxable earnings back to the true amount.

---

## ❓ Business Problems 
### 1. **Apples-to-Oranges Data Skews**
####   * Mixing part-time students, seasonal employees, and name-redacted privacy profiles with full-time staff destroys the accuracy of baseline workforce salary averages.

### 2. **Unrealistic Employee Career Horizons**
####   * Automated system defaults assign legacy placeholders like `1901-01-01` to missing entries, skewing employee tenure and retention statistics.

### 3. **Negative Number Distortions**
####   * Retroactive overpayment adjustments insert negative hours and negative cash values into standard columns, artificially dragging down minimum and average spending fields.

### 4. **Hidden Document Corruption & Wildcards**
####   * Typographical wildcards like `*` and `?` are accidentally saved directly into text titles, breaking standard database grouping queries.

### 5. **Undetected Personnel Burnout & Staffing Deficits**
####   * High-intensity agencies spend excessive funds on premium overtime metrics without clear operational indicators highlighting underlying staffing shortages.

### 6. **Distorted Annual Budget Spikes**
####   * Massive multi-million dollar collective bargaining back-pay payouts skew annual expenditure trends, making everyday agency operations look artificially expensive.

### 7. **Systemic Software Underpayment Breaches**
####   * Undetected automated programming glitches cause overtime hourly rates to plunge below standard shift rates, violating statutory labor laws.

### 8. **Unassigned Budgetary Drift**
####   * Cash flows through blank agency lines or zero-code department numbers, creating financial visibility leaks across legacy system frameworks.

### 9. **Runaway Operational Spending Acceleration**
####   * Management lacks visibility into whether emergency scheduling structures are stabilizing or accelerating out of control year-over-year.

---

## 💡 How This Audit Solves These Problems

| Business Problem | Dashboard / Audit Solution |
| :--- | :--- |
| **Apples-to-Oranges Data Skews** | **Workforce Segmentation** divides the workforce into 4 behavioral tracks to isolate full-time staff from part-time or redacted profiles. |
| **Unrealistic Career Horizons** | **Chronological Auditing** strips out the `1901` system default values while preserving valid historical dates from the 1940s. |
| **Negative Number Distortions** | **Negative Value Tracking** maps out retro-active corrections into an isolated bookkeeping column to keep mainstream mathematical averages pristine. |
| **Hidden Document Corruption** | **Wildcard Cleaning Logic** safely scrubs formatting symbols from cell fields without modifying or losing core job names. |
| **Personnel Burnout Deficits** | **Overwork & Burnout Matrix** calculates the exact ratio of overtime spending to identify short-staffed, high-risk agencies. |
| **Distorted Annual Budget Spikes** | **Union Contract Shock Filters** group massive individual paycheck spikes to prove and isolate collective bargaining back-pay lumps. |
| **Software Underpayment Breaches** | **Overtime Rate Compliance Audit** tracks regular rates against overtime rates to uncover automated math glitches and legal risk. |
| **Unassigned Budgetary Drift** | **Missing Department Firewalls** capture transactions running through empty strings or zero-number tracks to prevent unassigned leakage. |
| **Runaway Spending Acceleration** | **Budgetary Momentum Tracker** calculates multi-year velocity ratios to provide early dashboard warning signals before financial blowouts. |

---

## 🛠️ Data Cleaning & Pipeline Phase

### 1️⃣ Pay Basis vs. Rate Range Mismatches
*   **Objective**: Fix rows where an employee's contracted rate structure (Annual, Hourly, Daily) conflicts with their actual salary numbers.
  
*   **Issues Pointed In This Data/Code**: The system flagged valid \$1.00 token salaries for high officials as errors, while mislabeling standard hourly staff as annual, and grouping specialized budgetary engineers into hourly binned tracking locations.
  
*   **Updates and Alteration Code**: Implemented an automated conditional database classification flag (`Hours_Logic_Status`) that isolates standard clock-punching laborers from executive placeholders, salaried retirees, and specialized budgetary tracks without deleting records.
  
*   **After Changes**: The dataset is successfully segmented, protecting future hourly calculation scripts from dividing by zero or mixing executive flat rates with standard worker hours.

### 2️⃣ Time-Travel and Chronological Anomalies
*   **Objective**: Identify data entry errors where an employee's starting date occurs in the future or predates realistic human employment horizons.
  
*   **Issues Pointed In This Data/Code**: Uncovered **412 true chronological errors**, heavily clustered around the exact date `1901-01-01`. This represents an old legacy system database default value used when a true hire date was lost during historical file migrations.

*   **Updates and Alteration Code**: Executed a precision targeted update script to shift the `1901-01-01` placeholder records to database `NULL` markers, cleanly distinguishing them from true active workforce senior personnel.
  
*   **After Changes**: Chronological skews are eliminated, ensuring tenure tracking and seniority metrics match realistic human spans while fully protecting valid veterans who started working in the 1940s.

### 3️⃣ Future Checks & Negative Corrections

*   **Objective**: Audit the system for impossible future timelines and isolate negative numbers that pull down mainstream mathematical averages.
  
*   **Issues Pointed In This Data/Code**: Standard equality operators like `<> NULL` fail in SQL logic and miss data. Identified **16,272 rows** containing negative hours and negative pay used for overpayment corrections.
  
*   **Updates and Alteration Code**: Corrected the syntax parameters to explicit `IS NOT NULL` checks and permanently separated the negative adjustments into an isolated bookkeeping track labeled as `Payroll Correction`.
  
*   **After Changes**: All 16,000+ negative adjustments are safely categorized, preventing analytics queries from displaying artificially lowered spending baselines.

### 4️⃣ Wildcard Corruption and Missing Field Management
*   **Objective**: Strip broken system characters from job titles and build a uniform individual identification shortcut.
  
*   **Issues Pointed In This Data/Code**: Users accidentally saved search wildcards (`*`, `?`) directly into text titles (e.g., `CLERK*`), breaking grouping queries. Hidden space padding inside blank rows was also sneaking past missing-value filters.
  
*   **Updates and Alteration Code**: Used specific `REPLACE` string adjustments to wipe out rogue symbols without affecting core words. Engineered a permanent, standardized `Full_name` column utilizing regex space compaction routines.
  
*   **After Changes**: Wildcard clutter is resolved and name-based text aggregation functions run flawlessly without text spacing breaks or trailing character omissions.

### 5️⃣ Masked Identity Auditing
*   **Objective**: Audit duplicate records to ensure masked privacy profiles are preserved for financial reporting.
  
*   **Issues Pointed In This Data/Code**: Uncovered **65,782 records** with missing employee names. Tracking proved these rows belong strictly to sensitive law enforcement sectors (Police Department and District Attorney offices) where identities are redacted for safety.
  
*   **Updates and Alteration Code**: Safeguarded these rows by assigning them to a secure privacy classification track (`Redacted Identity (Security/Privacy Track)`) based on targeted agency keyword filters.
  
*   **After Changes**: Redacted entries are completely secure and accounted for under a customized security track instead of being misidentified as duplicate system clutter.

---

## 📈 Thematic Analysis & Advanced EDA Sections

### 1️⃣ Workforce Segmentation Matrix

*   **Objective**: Separate standard full-time career staff from seasonal laborers, student helpers, and identity-redacted tracks using business rules.
  
*   **Key Business Insight**: Categorizing the workforce by numeric pay traits instead of hardcoded title strings reveals the true fiscal footprint of the anonymous public safety sectors without distorting general average calculations.

### 2️⃣ The Overwork & Personnel Burnout Matrix

*   **Objective**: Pinpoint short-staffed departments by calculating what percentage of an agency's budget is consumed strictly by overtime cash.
  
*   **Key Business Insight**: Multiple core uniform agencies spend 30% to 50% extra on overtime relative to standard payroll costs. This proves severe understaffing where hiring additional full-time workers would actually be cheaper than paying constant premium time-and-a-half rates.

### 3️⃣ The Loyalty Pay Stagnation Paradox

*    **Objective**: Compare base salaries across employee service lengths to see if veteran workers face internal wage stagnation.
  
*    **Key Business Insight**: Market inflation forces entry-level starting wages upward to attract new talent, but internal raises fail to keep pace. Global averages show the starting pay for brand-new hires sits uncomfortably close to mid-level veteran pay, creating a massive employee retention risk.

### 4️⃣ Union Contract Shocks & Back-Pay Clusters

*    **Objective**: Prove whether giant paycheck spikes (employees grossing up to $500,000 over contract limits) are data entry bugs or legitimate municipal events.
  
*    **Key Business Insight**: The analysis exposed 12,092 separate Police Officers and 2,078 Special Ed Teachers hitting identical paycheck spikes in the exact same year, costing an extra $504 Million and $57 Million. This group clustering mathematically proves a massive, delayed union contract settlement rather than individual human error.

### 5️⃣ Systemic Software Math & Labor Law Compliance Risks
*    **Objective**: Measure the legal liability of records failing the statutory "time-and-a-half" overtime multiplier calculation.
  
*    **Key Business Insight**: Discovered a massive systemic software failure across 101,829 records. For 28,161 Police Officers, their regular rate was $30.33, but their overtime rate dropped to $27.67. This automated glitch impacts nearly $300 Million in overtime funds, exposing the city to severe labor law violations and mandatory back-pay lawsuits.

### 6️⃣ The Missing Department Budget Leak

*    **Objective**: Track and aggregate unassigned payroll tracks where department tracking codes are missing or empty.
  
*    **Key Business Insight**: Acts as an early data firewall. It flags where money is moving around generic placeholders, allowing accountants to force proper departmental re-mapping before unassigned budget drift obscures financial audit trails.

### 7️⃣ Overtime Runaway & Budgetary Momentum Tracker

*   **Objective**: Calculate the operational tipping points where an agency's overtime spending is accelerating out of control year-over-year.
  
*   **Key Business Insight**: Acts like a dashboard warning light. The Department of Correction shows dangerous runway momentum, with overtime share climbing steadily from 40% up to 45.55% in recent cycles. It also isolated a legacy track for the Department of Juvenile Justice where overtime outpaced regular pay by 1,000% due to closing down old facilities.

## 🧠 Key Insights

 1. Redacted Identities are Budgets: Over 65,000 records have masked employee names for legal safety, but their multi-million dollar spending prints remain completely traceable.
    
 2. Systemic Software Glitch Confirmed: Nearly $300 Million in public uniform overtime is tied up in records where an automated glitch causes overtime pay rates to plunge below standard regular shift rates.
    
 3. Union Settlements Cause Spikes: A single collective bargaining agreement created an artificial budget spike of $504 Million across 12,092 officers in one year, which must be isolated to find true annual trend lines.
    
 4. Staffing Crisis Quantified: Multiple core uniform agencies absorb a compounding 30% to 45% over-spend purely on overtime, proving severe operational staffing deficits.
    
 5. Tenure Stagnation Traps: Entry-level market adjustments cause starting wages to closely compress against mid-level veteran brackets, generating a severe workforce retention risk.

## 🛠️ Tools & Technologies Used:

 1. SQL (PostgreSQL) – Enterprise-level data extraction, forensic auditing, and schema transformation.
    
 2. pgAdmin 4 – Primary database administration management platform environment.

## 🎯 Final Business Outcome

 1. Using this analytical framework, an organization can:Shield operations from costly labor law compliance class-action lawsuits and back-pay fines.
  
 2. Isolate extreme collective bargaining contract shocks to reveal unskewed baseline cost growth.

 3. Identify short-staffed uniform departments needing hiring interventions over expensive overtime models.

 4. Secure and audit unassigned legacy budget tracks to freeze visibility leaks.

# 👤 Author: Nikhil Sagar

## 🎓 BBA Graduate | 📊 Data Analyst

### Skills

- SQL (PostgreSQL)
- Power BI & Tableau
- Microsoft Excel
- Data Analysis & Forensic Auditing
- Data Cleaning & Data Modeling

⭐ If you found this project useful, consider starring the repository! ⭐


