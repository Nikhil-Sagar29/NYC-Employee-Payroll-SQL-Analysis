# 📈 Phase 2: Thematic Analysis & Advanced EDA

This folder contains the complete 7-part advanced Exploratory Data Analysis (EDA) pipeline. These scripts convert our structured data flags into high-impact business metrics, tracking spending momentum, pay equity gaps, and systemic accounting issues.

---

## 1️⃣ Workforce Segmentation Matrix
*   **Objective**: Separate standard full-time career staff from seasonal laborers, student helpers, and identity-redacted tracks using business rules.
*   **SQL Code File**: [`01_workforce_segmentation.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/01.1_workforce_segmentation.sql)
*   **Output Image Grid**:`01_workforce_segmentation.png`
   ![01 - Workforce Segmentation.png](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/01.2%20-%20Work%20Segmentation%20output.png)
*   **Key Insight**: Categorizing the workforce by numeric pay traits instead of hardcoded title strings reveals the true fiscal footprint of the anonymous public safety sectors without distorting general average calculations.

---

## 2️⃣ The Overwork & Personnel Burnout Matrix
*   **Objective**: Pinpoint short-staffed departments by calculating what percentage of an agency's budget is consumed strictly by overtime cash.
*   **SQL Code File**: [`02_overtime_burnout.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/02.1_overtime_burnout.sql)
*   **Output Image Grid**: ![02_overtime_burnout.jpg](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/02.2%20-%20The%20Overwork%20%26%20Personnel%20Burnout%20output.jpg)
*   **Key Insight**: Multiple core uniform agencies spend **30% to 50% extra** on overtime relative to standard payroll costs. This proves severe understaffing where hiring additional full-time workers would actually be cheaper than paying constant premium time-and-a-half rates.

---

## 3️⃣ The Loyalty Pay Stagnation Paradox
*   **Objective**: Compare base salaries across employee service lengths to see if veteran workers face internal wage stagnation.
*   **SQL Code File**: [`03_salary_stagnation.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/03.1_salary_stagnation.sql)
*   **Output Image Grid**:`03_salary_stagnation.jpg` ![03_salary_stagnation.jpg](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/03.2%20-%20The%20Loyalty%20Pay%20Stagnation%20output.jpg)
*   **Key Insight**: Market inflation forces entry-level starting wages upward to attract new talent, but internal raises fail to keep pace. Global averages show the starting pay for brand-new hires sits uncomfortably close to mid-level veteran pay, creating a massive employee retention risk.

---

## 4️⃣ Union Contract Shocks & Back-Pay Clusters
*   **Objective**: Prove whether giant paycheck spikes (employees grossing up to $500,000 over contract limits) are data entry bugs or legitimate municipal events.
*   **SQL Code File**: [`04_union_contract_shocks.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/04.1_union_contract_shocks.sql)
*   **Output Image Grid**: `04_union_contract_shocks.png`![04_union_contract_shocks.png](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/04.2%20-%20Union%20Contract%20Shocks%20%26%20Back-Pay%20Clusters%20output.png)
*   **Key Insight**: The analysis exposed **12,092 separate Police Officers** and **2,078 Special Ed Teachers** hitting identical paycheck spikes in the exact same year, costing an extra **$504 Million** and **$57 Million**. This group clustering mathematically proves a massive, delayed union contract settlement rather than individual human error.

---

## 5️⃣ Systemic Software Math & Labor Law Compliance Risks
*   **Objective**: Measure the legal liability of records failing the statutory "time-and-a-half" overtime multiplier calculation.
*   **SQL Code File**: [`05_labor_compliance_risks.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/05.1_labor_compliance_risks.sql)
*   **Output Image Grid**: `05_labor_compliance_risks.jpg` ![05_labor_compliance_risks.jpg](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/05.2%20-%20Systemic%20Software%20%26%20Labor%20Compliance%20Risks%20output%20.jpg)
*   **Key Insight**: Discovered a massive systemic software failure across **101,829 records**. For **28,161 Police Officers**, their regular rate was $30.33, but their overtime rate *dropped* to $27.67. This automated glitch impacts nearly **$300 Million** in overtime funds, exposing the city to severe labor law violations and mandatory back-pay lawsuits.

---

## 6️⃣ The Missing Department Budget Leak
*   **Objective**: Track and aggregate unassigned payroll tracks where department tracking codes are missing or empty.
*   **SQL Code File**: [`06_ghost_department.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/06.1_ghost_department.sql)
*   **Output Image Grid**: `06_ghost_department.jpg` ![06_ghost_department.jpg](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/06.2%20-%20The%20Missing%20Department%20Budget%20Leak%20output.jpg)
*   **Key Insight**: Acts as an early data firewall. It flags where money is moving around generic placeholders, allowing accountants to force proper departmental re-mapping before unassigned budget drift obscures financial audit trails.

---

## 7️⃣ Overtime Runaway & Budgetary Momentum Tracker
*   **Objective**: Calculate the operational tipping points where an agency's overtime spending is accelerating out of control year-over-year.
*   **SQL Code File**: [`07_overtime_runaway.sql`](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/07.1_overtime_runaway.sql)
*   **Output Image Grid**: `07_overtime_runaway.jpg` ![07_overtime_runaway.jpg](https://github.com/Nikhil-Sagar29/NYC-Employee-Payroll-SQL-Analysis/blob/main/3-EDA%20(Exploratory%20Data%20Analysis)/07.2%20-%20Overtime%20Runaway%20%26%20Budgetary%20Momentum%20Tracker%20output.jpg)
*   **Key Insight**: Acts like a dashboard warning light. The **Department of Correction** shows dangerous runway momentum, with overtime share climbing steadily from 40% up to **45.55%** in recent cycles. It also isolated a legacy track for the **Department of Juvenile Justice** where overtime outpaced regular pay by **1,000%** due to closing down old facilities.
