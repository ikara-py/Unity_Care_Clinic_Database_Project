select
    *
from
    hospitalmanagment.patients;

-- EX 1 : Insert a new patient into the patients table.
insert into
    hospitalmanagment.patients (
        first_name,
        last_name,
        gender,
        date_of_birth,
        phone_number,
        email,
        address
    ) value (
        'alex',
        'johnson',
        'Male',
        '1990-07-15',
        1234567890,
        null,
        null
    );

--  EX 2 : Retrieve all departments with their locations. 
select
    *
from
    hospitalmanagment.departments;

--  EX 3 : Sort patients by date of birth. ASC
select
    *
from
    hospitalmanagment.patients
order by
    date_of_birth asc;

-- EX 4 : Retrieve all the sexes of registered patients, without duplicates. 
select distinct
    gender
from
    hospitalmanagment.patients;

-- EX 5 : Retrieve the first three doctors from the doctors table. 
select
    *
from
    hospitalmanagment.doctors
limit
    3;

-- EX 6 : Patients born after 2000 Retrieve information for patients born after the year 2000.
select
    *
from
    hospitalmanagment.patients
where
    date_of_birth > '2000-12-31';

-- EX 7 : Doctors in specific departments. Retrieve doctors from the "Cardiology" and "Neurology" departments. 
select
    *
from
    hospitalmanagment.doctors
where
    specialization = "Cardiology"
    or specialization = "Neurology";

-- EX 11 : Count the number of doctors in each department. 
select
    specialization,
    count(specialization) as count
from
    hospitalmanagment.doctors
group by
    specialization;

-- EX 12 : Calculate the average age of the patients.
select
    avg(timestampdiff(year, date_of_birth, curdate())) as avg_age
from
    hospitalmanagment.patients;
    


-- EX 17 :  Delete all appointments scheduled before 2024.
-- Exit from safe mode
SET sql_safe_updates = 0;

delete from appointments where appointment_date < '2024-01-01';

-- return to safe mode
SET sql_safe_updates = 1;


-- EX 18 : Change the name of the department "Oncology" to "Cancer Treatment". 

update hospitalmanagment.doctors set specialization = 'Cancer Treatment' where specialization = 'Oncology';

-- check
select * from hospitalmanagment.doctors;


-- EX 14 : Total admissions per room. Calculate the total admissions for each room.

select room_id, count(room_id) as  Total_admissions from hospitalmanagment.admissions group by room_id;

select * from hospitalmanagment.admissions;

use hospitalmanagment;