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
    date_of_birth > 2000;

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
SELECT
    avg(timestampdiff (YEAR, date_of_birth, curdate ())) AS AVG_Age
FROM
    hospitalmanagment.patients;