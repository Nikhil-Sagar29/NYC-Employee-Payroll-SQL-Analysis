# Datasets Overview

---

## File Structure

| SI.No | Property | Description |
| :--- | :--- | :--- |
| 1 | fiscal_year | The financial tracking year for the payroll record. |
| 2 | payroll_number | Unique code code for a specific department or pay cycle track. |
| 3 | agency_name | The city department or organization employing the person. |
| 4 | last_name | The employee's legal last name. |
| 5 | first_name | The employee's legal first name. |
| 6 | mid_init | The employee's middle initial if available. |
| 7 | agency_start_date | The official date the employee started working at the agency. |
| 8 | work_location_borough | The specific district or borough where the employee works. |
| 9 | title_description | The employee's official civil service job title or role. |
| 10 | leave_status_as_of_june_30 | The employee's active, terminal, or leave status at mid-year. |
| 11 | base_salary | The fundamental contracted base pay rate assigned to the role. |
| 12 | pay_basis | How the base salary is calculated (Per Annum, Per Hour, Per Day). |
| 13 | regular_hours | Total standard, non-overtime hours worked in the fiscal cycle. |
| 14 | regular_gross_paid | Total standard earnings paid out before taxes and deductions. |
| 15 | ot_hours | Total premium overtime hours logged by the worker. |
| 16 | total_ot_paid | Total monetary compensation paid out strictly for overtime shifts. |
| 17 | total_other_pay | Additional earnings like bonuses, uniform allowances, or longevity pay. |

---

## Pay Basis Tracks
The pay calculation forms can be:

1. Per Annum - Full-time salaried yearly baseline contract tracking.
2. Prorated Annual - Proportional or part-time annual pay scale lines.
3. Per Hour - Direct hourly wage tracks bound by active shift clockings.
4. Per Day - Per-diem contractor or short-burst operational payment metrics.

---

## Raw Datasets

### NYC Citywide Payroll Data - [![Dataset](https://img.shields.io/badge/Datasets-black)](https://data.cityofnewyork.us/City-Government/Citywide-Payroll-Data-Fiscal-Year-/k397-673e/about_data)

The Dataset Link above involves:
1. Contains raw, uncleaned, unassigned, and unfiltered municipal data.
2. High storage footprint spanning multiple consecutive fiscal years.
3. Hidden stringwildcards, system default placeholders, and negative adjustments present.
4. May cause grouping errors or performance lag in analytical platforms before cleanup.
5. Suitable for full-scale data engineering and validation workflows.

---

## Cleaned & Optimized Features Layer
The data architecture additions applied to the original table structure include:

1. **full_name** - Standardized uniform name column stripping leading dashes, trailing dots, and hidden spaces.
2. **workforce_track** - Behavioral group column partitioning career staff, hourly laborers, and redacted lines.
3. **hours_logic_status** - Structural flag separating standard workers from zero-hour salaried tracks or token placeholders.
4. **compliance_flag** - Diagnostic column isolating payroll corrections, sub-standard overtime rates, and data anomalies.

##### Note:
The cleanup routine preserves all true spending entries and structures the tables explicitly for faster Power BI and database query execution.

---

## Benefits
* Zero risk of dividing by zero errors during advanced rate calculations.
* Seamless exclusion of negative numbers or placeholder rows from baseline salary averages.
* Ready-to-use categorical slicers built directly into the table architecture for simple visual sorting.
