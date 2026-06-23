# 📈 Phase 2: Thematic Analysis & Advanced EDA

This folder contains the complete 7-part advanced Exploratory Data Analysis (EDA) pipeline. These scripts convert our structured data flags into high-impact business metrics, tracking spending momentum, pay equity gaps, and systemic accounting issues.

---

## 1️⃣ Workforce Segmentation Matrix
*   **Objective**: Separate standard full-time career staff from seasonal laborers, student helpers, and identity-redacted tracks using business rules.
*   **SQL Code File**: [`01_workforce_segmentation.sql`](./02_thematic_analysis/01_workforce_segmentation.sql)
*   **Output Image Grid**: `01_workforce_segmentation.png`
*   **Key Insight**: Categorizing the workforce by numeric pay traits instead of hardcoded title strings reveals the true fiscal footprint of the anonymous public safety sectors without distorting general average calculations.

---

## 2️⃣ The Overwork & Personnel Burnout Matrix
*   **Objective**: Pinpoint short-staffed departments by calculating what percentage of an agency's budget is consumed strictly by overtime cash.
*   **SQL Code File**: [`02_overtime_burnout.sql`](./02_thematic_analysis/02_overtime_burnout.sql)
*   **Output Image Grid**: `02_overtime_burnout.png`
*   **Key Insight**: Multiple core uniform agencies spend **30% to 50% extra** on overtime relative to standard payroll costs. This proves severe understaffing where hiring additional full-time workers would actually be cheaper than paying constant premium time-and-a-half rates.

---

## 3️⃣ The Loyalty Pay Stagnation Paradox
*   **Objective**: Compare base salaries across employee service lengths to see if veteran workers face internal wage stagnation.
*   **SQL Code File**: [`03_salary_stagnation.sql`](./02_thematic_analysis/03_salary_stagnation.sql)
*   **Output Image Grid**: `03_salary_stagnation.png`
*   **Key Insight**: Market inflation forces entry-level starting wages upward to attract new talent, but internal raises fail to keep pace. Global averages show the starting pay for brand-new hires sits uncomfortably close to mid-level veteran pay, creating a massive employee retention risk.

---

## 4️⃣ Union Contract Shocks & Back-Pay Clusters
*   **Objective**: Prove whether giant paycheck spikes (employees grossing up to $500,000 over contract limits) are data entry bugs or legitimate municipal events.
*   **SQL Code File**: [`04_union_contract_shocks.sql`](./02_thematic_analysis/04_union_contract_shocks.sql)
*   **Output Image Grid**: `04_union_contract_shocks.png`
*   **Key Insight**: The analysis exposed **12,092 separate Police Officers** and **2,078 Special Ed Teachers** hitting identical paycheck spikes in the exact same year, costing an extra **$504 Million** and **$57 Million**. This group clustering mathematically proves a massive, delayed union contract settlement rather than individual human error.

---

## 5️⃣ Systemic Software Math & Labor Law Compliance Risks
*   **Objective**: Measure the legal liability of records failing the statutory "time-and-a-half" overtime multiplier calculation.
*   **SQL Code File**: [`05_labor_compliance_risks.sql`](./02_thematic_analysis/05_labor_compliance_risks.sql)
*   **Output Image Grid**: `05_labor_compliance_risks.png`
*   **Key Insight**: Discovered a massive systemic software failure across **101,829 records**. For **28,161 Police Officers**, their regular rate was $30.33, but their overtime rate *dropped* to $27.67. This automated glitch impacts nearly **$300 Million** in overtime funds, exposing the city to severe labor law violations and mandatory back-pay lawsuits.

---

## 6️⃣ The Missing Department Budget Leak
*   **Objective**: Track and aggregate unassigned payroll tracks where department tracking codes are missing or empty.
*   **SQL Code File**: [`06_ghost_department.sql`](./02_thematic_analysis/06_ghost_department.sql)
*   **Output Image Grid**: `06_ghost_department.png`
*   **Key Insight**: Acts as an early data firewall. It flags where money is moving around generic placeholders, allowing accountants to force proper departmental re-mapping before unassigned budget drift obscures financial audit trails.

---

## 7️⃣ Overtime Runaway & Budgetary Momentum Tracker
*   **Objective**: Calculate the operational tipping points where an agency's overtime spending is accelerating out of control year-over-year.
*   **SQL Code File**: [`07_overtime_runaway.sql`](./02_thematic_analysis/07_overtime_runaway.sql)
*   **Output Image Grid**: `07_overtime_runaway.png`
*   **Key Insight**: Acts like a dashboard warning light. The **Department of Correction** shows dangerous runway momentum, with overtime share climbing steadily from 40% up to **45.55%** in recent cycles. It also isolated a legacy track for the **Department of Juvenile Justice** where overtime outpaced regular pay by **1,000%** due to closing down old facilities.
