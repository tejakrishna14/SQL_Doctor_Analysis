-- CREATE DATABASE Doctors_MiniProject;
USE Doctors_MiniProject;

CREATE TABLE province_names (
    province_id CHAR(2) PRIMARY KEY,
    province_name VARCHAR(30) NOT NULL
);

INSERT INTO province_names (province_id, province_name) VALUES
('ON', 'Ontario'),
('QC', 'Quebec'),
('BC', 'British Columbia'),
('AB', 'Alberta'),
('MB', 'Manitoba'),
('SK', 'Saskatchewan'),
('NS', 'Nova Scotia'),
('NB', 'New Brunswick'),
('NL', 'Newfoundland and Labrador'),
('PE', 'Prince Edward Island'),
('CA', 'California'),
('TX', 'Texas'),
('FL', 'Florida'),
('NY', 'New York'),
('PA', 'Pennsylvania'),
('IL', 'Illinois'),
('OH', 'Ohio'),
('GA', 'Georgia'),
('NC', 'North Carolina'),
('MI', 'Michigan');

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    specialty VARCHAR(25)
);

INSERT INTO doctors (doctor_id, first_name, last_name, specialty) VALUES
(1, 'John', 'Smith', 'Cardiology'),
(2, 'Emily', 'Johnson', 'Neurology'),
(3, 'Michael', 'Williams', 'Pediatrics'),
(4, 'Sarah', 'Brown', 'General Surgery'),
(5, 'David', 'Jones', 'Oncology'),
(6, 'Jessica', 'Garcia', 'Dermatology'),
(7, 'Daniel', 'Miller', 'Orthopedics'),
(8, 'Laura', 'Davis', 'Gastroenterology'),
(9, 'James', 'Rodriguez', 'Pulmonology'),
(10, 'Linda', 'Martinez', 'Endocrinology'),
(11, 'Robert', 'Hernandez', 'Cardiology'),
(12, 'Patricia', 'Lopez', 'Neurology'),
(13, 'Charles', 'Gonzalez', 'Pediatrics'),
(14, 'Barbara', 'Wilson', 'General Surgery'),
(15, 'Thomas', 'Anderson', 'Oncology'),
(16, 'Nancy', 'Thomas', 'Dermatology'),
(17, 'Mark', 'Taylor', 'Orthopedics'),
(18, 'Elizabeth', 'Moore', 'Gastroenterology'),
(19, 'Paul', 'Jackson', 'Pulmonology'),
(20, 'Jennifer', 'White', 'Endocrinology');

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender CHAR(1),
    birth_date DATE,
    city VARCHAR(30),
    province_id CHAR(2),
    allergies VARCHAR(80),
    height DECIMAL(3,0),
    weight DECIMAL(4,0),
    FOREIGN KEY (province_id) REFERENCES province_names(province_id)
);

INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight) VALUES
(101, 'William', 'Harris', 'M', '1985-05-20', 'Toronto', 'ON', 'Penicillin', 180, 185),
(102, 'Mary', 'Martin', 'F', '1992-07-14', 'Vancouver', 'BC', 'None', 165, 130),
(103, 'Richard', 'Thompson', 'M', '1978-11-30', 'Montreal', 'QC', 'Peanuts', 175, 190),
(104, 'Susan', 'Clark', 'F', '2001-02-18', 'Calgary', 'AB', 'None', 170, 140),
(105, 'Joseph', 'Lewis', 'M', '1965-09-01', 'Winnipeg', 'MB', 'Sulfa drugs', 182, 205),
(106, 'Karen', 'Lee', 'F', '1988-12-25', 'Saskatoon', 'SK', 'None', 160, 125),
(107, 'Steven', 'Walker', 'M', '1995-04-10', 'Halifax', 'NS', 'Pollen', 190, 210),
(108, 'Lisa', 'Hall', 'F', '1983-08-08', 'Fredericton', 'NB', 'None', 168, 135),
(109, 'Brian', 'Allen', 'M', '1971-06-15', 'St. John''s', 'NL', 'Aspirin', 178, 195),
(110, 'Dorothy', 'Young', 'F', '1999-01-22', 'Charlottetown', 'PE', 'None', 172, 145),
(111, 'Kevin', 'King', 'M', '1980-03-03', 'Los Angeles', 'CA', 'Shellfish', 185, 200),
(112, 'Donna', 'Wright', 'F', '1976-10-19', 'Houston', 'TX', 'None', 163, 150),
(113, 'Edward', 'Scott', 'M', '1993-07-07', 'Miami', 'FL', 'Cats', 177, 180),
(114, 'Sandra', 'Green', 'F', '1989-05-12', 'New York', 'NY', 'None', 169, 138),
(115, 'George', 'Adams', 'M', '1968-04-29', 'Philadelphia', 'PA', 'Ibuprofen', 174, 188),
(116, 'Carol', 'Baker', 'F', '2003-11-09', 'Chicago', 'IL', 'None', 158, 120),
(117, 'Ronald', 'Nelson', 'M', '1959-08-21', 'Columbus', 'OH', 'Dust Mites', 181, 198),
(118, 'Michelle', 'Carter', 'F', '1996-09-02', 'Atlanta', 'GA', 'None', 166, 133),
(119, 'Anthony', 'Mitchell', 'M', '1982-12-31', 'Raleigh', 'NC', 'Latex', 179, 192),
(120, 'Betty', 'Perez', 'F', '1974-02-14', 'Detroit', 'MI', 'None', 161, 148);

CREATE TABLE admissions (
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(50),
    attending_doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (attending_doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id) VALUES
(101, '2024-06-10', '2024-06-15', 'Myocardial Infarction', 1),
(102, '2024-07-22', '2024-07-28', 'Migraine Cluster', 2),
(103, '2024-08-01', '2024-08-05', 'Asthma Exacerbation', 9),
(104, '2025-01-15', '2025-01-20', 'Pneumonia', 3),
(105, '2025-02-20', '2025-03-01', 'Appendectomy', 4),
(106, '2025-03-10', '2025-03-12', 'Melanoma Excision', 6),
(107, '2025-04-05', '2025-04-12', 'Tibia Fracture', 7),
(108, '2025-05-18', '2025-05-22', 'Gastroenteritis', 8),
(109, '2025-06-30', '2025-07-05', 'COPD Flare-up', 9),
(110, '2025-07-11', '2025-07-15', 'Diabetic Ketoacidosis', 10),
(111, '2024-09-15', '2024-09-21', 'Angina Pectoris', 11),
(112, '2024-10-01', NULL, 'Ischemic Stroke', 12),
(113, '2024-11-10', '2024-11-14', 'Bronchitis', 13),
(114, '2024-12-05', '2024-12-12', 'Cholecystectomy', 14),
(115, '2025-01-25', NULL, 'Lung Cancer Diagnosis', 15),
(116, '2025-02-18', '2025-02-20', 'Psoriasis Treatment', 16),
(117, '2025-03-22', '2025-03-30', 'Knee Replacement', 17),
(118, '2025-04-14', '2025-04-19', 'Ulcerative Colitis', 18),
(119, '2025-05-01', NULL, 'Pulmonary Embolism', 19),
(120, '2025-06-08', '2025-06-12', 'Hyperthyroidism Management', 20),
(101, '2025-08-02', NULL, 'Chest Pain Observation', 1);


-- 1.Show firstname lastname of patients gender M
SELECT first_name,last_name,gender
FROM patients
WHERE gender = "M";

-- 2.Show firstname and lastname of patients who dosent have allergies
SELECT first_name,last_name,allergies
FROM patients
WHERE allergies = "None"; -- We can use allergies IS NULL if it is specified in that way

-- 3.Show patients firstname whose name starts with C
SELECT first_name
FROM patients
WHERE first_name LIKE "C%";

-- 4.Show firstname of patients whose weights range between 100 and 140(including those weights)
SELECT first_name
FROM patients
WHERE weight >=100 AND weight <=140;

-- 5.Update patient table where allergies is none replace it with nka
UPDATE patients
SET allergies = "NKA"
WHERE allergies = "None";

-- 6.Show firstname lastname concatenated in a single column as full name
SELECT CONCAT(first_name," ",last_name) as Full_Name
FROM patients;

-- 7.Show firstname lastname and full province name of each patient
SELECT first_name,last_name,province_name 
FROM patients as p
JOIN province_names as pn
ON pn.province_id = p.province_id;

-- 8.Show how many patients have a birth_date with birth year in 1980
SELECT COUNT(*) 
FROM patients
WHERE YEAR(birth_date) = "1980";

-- 9.Show firstname lastname of the patient with the gratest height
SELECT first_name,last_name
FROM patients
WHERE height = (
	SELECT MAX(height)
    FROM patients
);

-- 10.Show all the columns for patients who have patient_id: 1,6,8,12,19,20
SELECT * 
FROM patients
WHERE patient_id IN (101,106,108,112,119,120);

-- 11.Show all the columns from admission table where the admission date and discharge date is same
SELECT * 
FROM admssions
WHERE admission_date = discharge_date;

-- 12.Show patient id and total number of admissions for id 108
SELECT COUNT(*) 
FROM admissions AS Total_Admissions
WHERE patient_id = "108";
















