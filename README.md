# Unity Care Clinic – Database Project

## 1. Project Context

### 1.1 Main Objective  
Build a high-performance, well-architected database that underpins every operational feature of Unity Care Clinic and guarantees optimal data management.

### 1.2 Functional Scope  
The database is the single source of truth for a complete hospital-management system.  
It must safely centralize:

* Departments and staff (physicians, administrators)  
* Patients and their admissions  
* Room management  
* Appointment scheduling  
* Drugs and prescriptions

### 1.3 Technical Components  

| Component | Description |
|-----------|-------------|
| **Schema** | All tables are derived from the supplied ERD. |
| **Core exercises** | 20 guided SQL exercises covering CRUD → advanced aggregation, constraints, joins, views, `HAVING`, `GROUP BY`. |
| **Bonus exercises** | 5 extra queries that stress-test complex joins and multi-table reasoning. |

---

## 2. Core SQL Exercises (20)

| # | Task | Topic |
|---|------|-------|
| 1 | Insert a new patient: Alex Johnson, 1990-07-15, Male, phone 1234567890. | CRUD – INSERT |
| 2 | List every department with its location. | SELECT |
| 3 | List all patients ordered by ascending date of birth. | ORDER BY |
| 4 | Return the distinct sex values stored in the patient table. | DISTINCT |
| 5 | Fetch the first 3 rows from the doctors table. | LIMIT |
| 6 | Retrieve patients born after the year 2000. | WHERE |
| 7 | Get doctors working in Cardiology **or** Neurology. | Logical operators |
| 8 | List admissions between 2024-12-01 and 2024-12-07. | Special operators |
| 9 | Add a computed column that labels patients Child / Adult / Senior. | Conditional expressions |
| 10 | Count the total number of appointments. | Aggregate – COUNT |
| 11 | Count how many doctors exist in each department. | COUNT + GROUP BY |
| 12 | Calculate the average age of all patients. | Aggregate – AVG |
| 13 | Find the latest appointment date-time. | Aggregate – MAX |
| 14 | Compute the total number of admissions per room. | Aggregate – SUM |
| 15 | List patients whose e-mail field is NULL or empty. | Constraints check |
| 16 | Return appointments showing doctor name **and** patient name. | JOIN |
| 17 | Delete every appointment scheduled before 2024-01-01. | CRUD – DELETE |
| 18 | Rename the department “Oncology” to “Cancer Treatment”. | CRUD – UPDATE |
| 19 | List sex values having at least two patients. | HAVING |
| 20 | Create a view named `active_admissions` that lists currently open admissions. | VIEW |

---

## 3. Bonus Exercises – Advanced Joins (5)

1. For each doctor show the number of distinct patients they have ever seen.  
2. List rooms that have been occupied more than 90 % of the time in the last 30 days.  
3. Produce a timeline of every drug prescription including patient, doctor, drug name, dosage, and administration date.  
4. Return departments with zero doctors assigned.  
5. Calculate the average length of stay (admission → discharge) per department.

---

## 4. Deliverables

* Fully documented relational schema (`.sql` DDL script).  
* 20 + 5 executable query files (`xx_description.sql`).  
* This readme (`unity-care-clinic-db.md`).