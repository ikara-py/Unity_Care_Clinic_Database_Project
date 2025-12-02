-- create the database
create database HospitalManagment; 


-- use the database
use HospitalManagment; 


-- drop the table
drop table HospitalManagment.patients;  


-- create the table
create table patients(  
	patient_id int(11) auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    gender enum('Male', 'Female', 'Other'),
    date_of_birth date,
    phone_number varchar(100),
    email varchar(100),
    address varchar(255),
    primary key(patient_id)
);


-- view all patients (all columns and raws);
select * from hospitalmanagment.patients;


-- inject patients into the table 'hospitalmanagment.patients'
insert into hospitalmanagment.patients (first_name, last_name, gender, date_of_birth, phone_number, email, address ) value 
('Yasmine', 'Bennis', 'Female', '1991-04-12', '0612345678', 'yasmine.bennis@gmail.com', 'Rue 20 Août, Casablanca'),
('Omar', 'Chakir', 'Male', '1988-07-03', '0611223344', 'omar.chakir@outlook.ma', 'Boulevard Mohamed V, Rabat'),
('Sara', 'El Amrani', 'Female', '1995-11-25', '0655566677', 'sara.amrani@hotmail.com', 'Avenue Hassan II, Marrakech'),
('Mehdi', 'Fassi', 'Male', '1993-02-16', '0677889900', 'mehdi.fassi@live.fr', 'Rue de Fès, Meknès'),
('Imane', 'Lakhdar', 'Female', '1990-09-08', '0644455566', 'imane.lakhdar@yahoo.fr', 'Rue Nador, Tanger'),
('Hamza', 'Bourkadi', 'Male', '1987-12-30', '0622233344', 'hamza.bourkadi@gmail.com', 'Boulevard Allal Al Fassi, Fès'),
('Ghita', 'Tazi', 'Female', '1992-05-21', '0666677788', 'ghita.tazi@outlook.ma', 'Rue Ibn Rochd, Agadir'),
('Anas', 'Sebbar', 'Male', '1994-08-14', '0633344455', 'anas.sebbar@hotmail.com', 'Avenue Mohammed VI, Oujda'),
('Salma', 'Zerhouni', 'Female', '1989-01-07', '0655577899', 'salma.zerhouni@gmail.com', 'Rue Laayoune, Kenitra'),
('Ayoub', 'Naciri', 'Male', '1996-06-19', '0688899900', 'ayoub.naciri@live.fr', 'Boulevard Tahir Ibnou Houcine, Tetouan');


-- create medication table
create table medications(
	medication_id int(11) auto_increment,
	medication_name varchar(100),
	dosage varchar(50),
	primary key(medication_id)
);


-- view medication table
select * from hospitalmanagment.medications;


-- create departments table
create table departments(
	department_id int(11) auto_increment,
	department_name varchar(50),
	location varchar(100),
	primary key(department_id)
);


-- view departments table
select * from hospitalmanagment.departments;


-- create doctor table 
create table doctors(
	doctor_id int(11) auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	specialization varchar(50),
	phone_number varchar(15),
	email varchar(100),
	department_id int(11),
	primary key(doctor_id),
	foreign key(department_id) references departments (department_id)
);


-- view doctors table
select * from hospitalmanagment.doctors;


-- create prescriptions table
create table prescriptions(
	prescription_id int(11) auto_increment,
	patient_id int(11),
    doctor_id int(11),
	medication_id int(11),
	primary key(prescription_id),
	FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
	foreign key(medication_id) references medications(medication_id),
	foreign key(doctor_id) references doctors(doctor_id),
	perscription_date date,
	dosage_instructions varchar(50)
);


-- view prescriptions table
select * from hospitalmanagment.prescriptions;


-- create appointments table
create table appointments(
appointment_id int(11) auto_increment,
appointment_date date,
appointment_time time,
doctor_id int(11),
patient_id int(11),
primary key(appointment_id),
foreign key(doctor_id) references doctors(doctor_id),
foreign key(patient_id) references patients(patient_id)
);


-- add a colunm to appointments
alter table appointments add reason varchar(255);


-- view appointments table
select * from hospitalmanagment.appointments;


-- create rooms table
create table rooms(
room_id int(11) auto_increment,
room_number varchar(10),
room_type enum('General', 'Private', 'ICU'),
primary key(room_id)
);


-- add availability to rooms table
alter table rooms add availability tinyint(1);


-- view rooms table
select * from hospitalmanagment.rooms;


create table admissions(
admission_id int(11) auto_increment,
patient_id int(11),
room_id int(11),
admission_date date,
discharge_id date,
foreign key(patient_id) references patients(patient_id),
foreign key(room_id) references rooms(room_id),
primary key(admission_id)
);


-- view admissions table
select * from hospitalmanagment.admissions;


-- create staff table
create table staff(
staff_id int(11) auto_increment,
first_name varchar(50),
last_name varchar(50),
job_title varchar(50),
phone_number varchar(50),
email varchar(100),
department_id int(11),
foreign key(department_id) references departments(department_id),
primary key(staff_id)
);


-- view staff table
select * from hospitalmanagment.staff;

insert into doctors (first_name, last_name, specialization, phone_number, email) 
VALUES ('Aisha', 'Khan', 'Cardiology', '0622091891', 'aisha.khan@hospital.com'),
	('Ben', 'Carter', 'Pediatrics', '0622091891', 'ben.carter@hospital.com'),
	('Sarah', 'Chen', 'Neurology', '0622091891', 'sarah.chen@hospital.com'),
	('David', 'Patel', 'Orthopedics', '0622091891', 'david.patel@hospital.com'),
	('Elena', 'Vargas', 'Dermatology', '0622091891', 'elena.vargas@hospital.com'),
	('Emily', 'Chen', 'Cardiology', '0601234567', 'emily.chen@hospital.com'),
	('Liam', 'Brown', 'Neurology', '0612345678', 'liam.brown@hospital.com'),
	('Ava', 'Davis', 'Pediatrics', '0623456789', 'ava.davis@hospital.com'),
	('Noah', 'Taylor', 'Cardiology', '0634567890', 'noah.taylor@hospital.com'),
	('Sophia', 'Martin', 'Oncology', '0645678901', 'sophia.martin@hospital.com'),
	('Ethan', 'Hall', 'Neurology', '0656789012', 'ethan.hall@hospital.com'),
	('Mia', 'White', 'Dermatology', '0667890123', 'mia.white@hospital.com'),
	('Lucas', 'Walker', 'Cardiology', '0678901234', 'lucas.walker@hospital.com'),
	('Isabella', 'Allen', 'Gynecology', '0689012345', 'isabella.allen@hospital.com'),
	('Mason', 'Scott', 'Neurology', '0690123456', 'mason.scott@hospital.com');
    
    
select * from hospitalmanagment.doctors;