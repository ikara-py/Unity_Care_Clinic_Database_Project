-- create the database
create database hospitalmanagment;

-- use the database
use hospitalmanagment;


-- 1. DEPARTMENTS
create table departments (
    department_id int(11) auto_increment,
    department_name varchar(50),
    location varchar(100),
    primary key (department_id)
);

insert into departments (department_name, location) values
('cardiology', 'building a, floor 2'),
('pediatrics', 'building b, floor 1'),
('neurology', 'building a, floor 3'),
('orthopedics', 'building c, floor 2'),
('dermatology', 'building b, floor 3'),
('oncology', 'building c, floor 1'),
('gynecology', 'building a, floor 1');

-- 2. MEDICATIONS
create table medications (
    medication_id int(11) auto_increment,
    medication_name varchar(100),
    dosage varchar(50),
    primary key (medication_id)
);

insert into medications (medication_name, dosage) values
('paracetamol', '500mg'),
('amoxicillin', '250mg'),
('metformin', '850mg'),
('lisinopril', '10mg'),
('atorvastatin', '20mg');

-- 3. PATIENTS
create table patients (
    patient_id int(11) auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    gender enum ('male', 'female', 'other'),
    date_of_birth date,
    phone_number varchar(100),
    email varchar(100),
    address varchar(255),
    primary key (patient_id)
);

insert into patients (patient_id, first_name, last_name, gender, date_of_birth, phone_number, email, address) values
(1, 'yasmine', 'bennis', 'female', '1991-04-12', '0612345678', 'yasmine.bennis@gmail.com', 'rue 20 août, casablanca'),
(2, 'omar', 'chakir', 'male', '1988-07-03', '0611223344', 'omar.chakir@outlook.ma', 'boulevard mohamed v, rabat'),
(3, 'sara', 'el amrani', 'female', '1995-11-25', '0655566677', 'sara.amrani@hotmail.com', 'avenue hassan ii, marrakech'),
(4, 'mehdi', 'fassi', 'male', '1993-02-16', '0677889900', 'mehdi.fassi@live.fr', 'rue de fès, meknès'),
(5, 'imane', 'lakhdar', 'female', '1990-09-08', '0644455566', 'imane.lakhdar@yahoo.fr', 'rue nador, tanger'),
(6, 'hamza', 'bourkadi', 'male', '1987-12-30', '0622233344', 'hamza.bourkadi@gmail.com', 'boulevard allal al fassi, fès'),
(7, 'ghita', 'tazi', 'female', '1992-05-21', '0666677788', 'ghita.tazi@outlook.ma', 'rue ibn rochd, agadir'),
(8, 'anas', 'sebbar', 'male', '1994-08-14', '0633344455', 'anas.sebbar@hotmail.com', 'avenue mohammed vi, oujda'),
(9, 'salma', 'zerhouni', 'female', '1989-01-07', '0655577899', 'salma.zerhouni@gmail.com', 'rue laayoune, kenitra'),
(10, 'ayoub', 'naciri', 'male', '1996-06-19', '0688899900', 'ayoub.naciri@live.fr', 'boulevard tahir ibnou houcine, tetouan');

-- 4. ROOMS
create table rooms (
    room_id int(11) auto_increment,
    room_number varchar(10),
    room_type enum ('general', 'private', 'icu'),
    availability tinyint(1),
    primary key (room_id)
);

insert into rooms (room_number, room_type, availability) values
('101a', 'private', 1),
('101b', 'private', 0),
('102', 'general', 1),
('103', 'general', 1),
('104', 'general', 0),
('201', 'private', 1),
('202', 'private', 1),
('301', 'icu', 0),
('302', 'icu', 1),
('303', 'icu', 0),
('401a', 'general', 1),
('401b', 'general', 0),
('402', 'private', 1),
('403', 'general', 1),
('501', 'icu', 0);

-- 5. DOCTORS
create table doctors (
    doctor_id int(11) auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    specialization varchar(50),
    phone_number varchar(15),
    email varchar(100),
    department_id int(11),
    primary key (doctor_id),
    foreign key (department_id) references departments (department_id)
);

insert into doctors (doctor_id, first_name, last_name, specialization, phone_number, email, department_id) values
(1, 'aisha', 'khan', 'cardiology', '0622091891', 'aisha.khan@hospital.com', 1),
(2, 'ben', 'carter', 'pediatrics', '0622091891', 'ben.carter@hospital.com', 2),
(3, 'sarah', 'chen', 'neurology', '0622091891', 'sarah.chen@hospital.com', 3),
(4, 'david', 'patel', 'orthopedics', '0622091891', 'david.patel@hospital.com', 4),
(5, 'elena', 'vargas', 'dermatology', '0622091891', 'elena.vargas@hospital.com', 5),
(6, 'emily', 'chen', 'cardiology', '0601234567', 'emily.chen@hospital.com', 1),
(7, 'liam', 'brown', 'neurology', '0612345678', 'liam.brown@hospital.com', 3),
(8, 'ava', 'davis', 'pediatrics', '0623456789', 'ava.davis@hospital.com', 2),
(9, 'noah', 'taylor', 'cardiology', '0634567890', 'noah.taylor@hospital.com', 1),
(10, 'sophia', 'martin', 'oncology', '0645678901', 'sophia.martin@hospital.com', 6),
(11, 'ethan', 'hall', 'neurology', '0656789012', 'ethan.hall@hospital.com', 3),
(12, 'mia', 'white', 'dermatology', '0667890123', 'mia.white@hospital.com', 5),
(13, 'lucas', 'walker', 'cardiology', '0678901234', 'lucas.walker@hospital.com', 1),
(14, 'isabella', 'allen', 'gynecology', '0689012345', 'isabella.allen@hospital.com', 7),
(15, 'mason', 'scott', 'neurology', '0690123456', 'mason.scott@hospital.com', 3);

-- 6. STAFF
create table staff (
    staff_id int(11) auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    job_title varchar(50),
    phone_number varchar(50),
    email varchar(100),
    department_id int(11),
    foreign key (department_id) references departments (department_id),
    primary key (staff_id)
);

insert into staff (staff_id, first_name, last_name, job_title, phone_number, email, department_id) values
(101, 'fatima', 'zahra', 'head nurse', '0699001122', 'fatima.zahra@hospital.com', 1),
(102, 'khalid', 'amine', 'nurse', '0688776655', 'khalid.amine@hospital.com', 2),
(103, 'nadia', 'karim', 'nurse', '0677665544', 'nadia.karim@hospital.com', 3),
(104, 'rachid', 'hassan', 'physical therapist', '0655443322', 'rachid.hassan@hospital.com', 4),
(105, 'samira', 'mansour', 'lab technician', '0644332211', 'samira.mansour@hospital.com', 6),
(106, 'youssef', 'idrissi', 'administrator', '0633221100', 'youssef.idrissi@hospital.com', 7),
(107, 'leila', 'benali', 'nurse assistant', '0622110099', 'leila.benali@hospital.com', 1),
(108, 'tarik', 'alaoui', 'receptionist', '0611009988', 'tarik.alaoui@hospital.com', 5);

-- 7. APPOINTMENTS 
create table appointments (
    appointment_id int(11) auto_increment,
    appointment_date date,
    appointment_time time,
    doctor_id int(11),
    patient_id int(11),
    reason varchar(255),
    primary key (appointment_id),
    foreign key (doctor_id) references doctors (doctor_id),
    foreign key (patient_id) references patients (patient_id)
);

insert into appointments (appointment_date, appointment_time, doctor_id, patient_id, reason) values
('2025-12-05', '09:00:00', 4, 1, 'persistent knee pain after running'),
('2025-12-05', '10:30:00', 1, 9, 'follow-up on blood pressure'),
('2025-12-06', '14:00:00', 5, 2, 'rash appearing on arms'),
('2025-12-06', '16:45:00', 3, 5, 'migraine consultation'),
('2025-12-07', '08:15:00', 14, 3, 'annual gynecological exam'),
('2025-12-07', '11:00:00', 10, 8, 'discussion of biopsy results'),
('2025-12-08', '13:30:00', 1, 6, 'heart rate irregularity'),
('2025-12-09', '09:45:00', 12, 7, 'acne treatment review');

-- 8. ADMISSIONS
create table admissions (
    admission_id int(11) auto_increment,
    patient_id int(11),
    room_id int(11),
    admission_date date,
    discharge_date date,
    foreign key (patient_id) references patients (patient_id),
    foreign key (room_id) references rooms (room_id),
    primary key (admission_id)
);

insert into admissions (patient_id, room_id, admission_date, discharge_date) values
(5, 8, '2025-11-28', '2025-12-05'),
(2, 4, '2025-12-01', null),
(9, 1, '2025-11-15', '2025-11-20'),  
(4, 15, '2025-12-04', null);  

-- 9. PRESCRIPTIONS
-- (SCRAMBLED: Completely mixed Patients, Doctors, and Medications)
create table prescriptions (
    prescription_id int(11) auto_increment,
    patient_id int(11),
    doctor_id int(11),
    medication_id int(11),
    prescription_date date,
    dosage_instructions varchar(50),
    primary key (prescription_id),
    foreign key (patient_id) references patients (patient_id),
    foreign key (medication_id) references medications (medication_id),
    foreign key (doctor_id) references doctors (doctor_id)
);

insert into prescriptions (patient_id, doctor_id, medication_id, prescription_date, dosage_instructions) values
(9, 1, 4, '2025-12-05', '1 tablet daily for BP'),  
(2, 5, 2, '2025-12-05', '250mg twice a day for infection'),
(4, 4, 1, '2025-12-06', '500mg as needed for pain'),  
(1, 3, 5, '2025-12-06', 'take with dinner'),
(8, 2, 2, '2025-12-07', 'complete the full course'),
(3, 14, 3, '2025-12-07', '850mg with meals');