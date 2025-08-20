-- 18.Show patient_id attending_doctor_id and diagnosis that matches one of the two criteria
-- patient is odd number and attending doctor is 1,5,19
-- attending doctor has 2 and patient_id lenght is atleast 3

SELECT patient_id,attending_doctor_id,diagnosis
FROM admissions 
WHERE 
patient_id%2 != 0 AND attending_doctor_id IN (1,5,9)
OR
attending_doctor_id = "%2%" AND LENGTH(patient_id) = 3;

-- 19.Show firstname lastname and total number of admissions attended for each doctor
-- every admission has been attended by a doctor

SELECT first_name,last_name,
COUNT(*) AS admissions_total

FROM admissions as a
JOIN doctors as d
ON d.doctor_id = a.attending_doctor_id
GROUP BY a.attending_doctor_id;

-- 20.For each doctor display their id full name first and last admission date they attended
SELECT doctor_id,
CONCAT(first_name,' ',last_name) AS Full_Name,
MIN(DATE(admission_date)) AS First_Admission,
MAX(DATE(admission_date)) AS Last_Admission

FROM doctors as d
JOIN admissions as a
ON d.doctor_id = a.attending_doctor_id

GROUP BY d.doctor_id;

-- 21.Display the total number of patients for each province. Order by descending 
SELECT province_name,COUNT(*) AS Patient_Count
FROM province_names as pr JOIN patients as p
ON p.province_id = pr.province_id
GROUP BY pr.province_id
ORDER BY patient_count DESC;

-- 22.For every admission display patients full name their diagnosis and their doctors full name
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_fullname,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_fullname,
    a.diagnosis
FROM
    admissions AS a
JOIN
    patients AS p ON a.patient_id = p.patient_id 
JOIN
    doctors AS d ON a.attending_doctor_id = d.doctor_id;

-- 23.Display the firstname last name and the number of duplicate patients based on their name
SELECT first_name,last_name,COUNT(*) AS Number_of_duplicates
FROM patients
GROUP BY first_name,last_name
HAVING Number_of_duplicates > 1;

-- 24.Display patient's full name,height in the units feet rounded to 1 decimal,weight in the unit pounds rounded to 0 decimals,
-- birth_date,gender non abbreviated.
-- Convert CM to feet by dividing by 30.48.Convert KG to pounds by multiplying by 2.205.

SELECT 
    CONCAT(first_name, ' ', last_name) AS patient_fullname,
    ROUND(height / 30.48, 1) AS height_in_feet,
    ROUND(weight * 2.205, 0) AS weight_in_pounds,
    birth_date,
    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Other'
    END AS gender_type
FROM
    patients;

-- 25.Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. 
-- (Their patient_id does not exist in any admissions.patient_id rows.)
SELECT
    patient_id,
    first_name,
    last_name
FROM
    patients
WHERE
    patient_id 
    NOT IN (SELECT DISTINCT patient_id FROM admissions);
    
-- 26.Display a single row with maxvisits minvisits and avg visits where the max min and avg number of admissions are calculated
-- Average is rounded to two decimals 
-- Recheck
SELECT 
    MAX(num_admissions) AS Max_Visits,
    MIN(num_admissions) AS Min_Visits,
    ROUND(AVG(num_admissions), 2) AS Avg_Visits
FROM
    (SELECT 
        admission_date, COUNT(*) AS num_admissions
    FROM
        admissions
    GROUP BY admission_date);



-- 27.Show all of the patients grouped into weight groups.
-- Show the total amount of patients in each weight group.
-- Order the list by the weight group decending.
-- For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

SELECT COUNT(patient_id) AS patients_in_group,
FLOOR(weight/10)*10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- 28.

SELECT patient_id,weight,height,
(CASE WHEN
(weight/POWER((height/100))) >=30 THEN 1
ELSE 0
END )AS isObese
FROM patients;


-- 29.Show patient_id, first_name, last_name, and attending doctor's specialty.
-- Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
-- Check patients, admissions, and doctors tables for required information.

SELECT p.patient_id,p.first_name,p.last_name,specialty
FROM patients as p
JOIN admissions as a 
ON p.patient_id = a.patient_id
JOIN doctors as d 
ON d.doctor_id = a.attending_doctor_id

WHERE d.first_name='Lisa' AND diagnosis = "Epilepsy";

-- 30
SELECT distinct(patient_id), CONCAT(patient_id, LENGTH(last_name),YEAR(birth_date)) AS temp_password
FROM patients as p JOIN admission as a ON p.patient_id=a.patient_id

-- 31.
SELECT
CASE WHEN patient_id%2 = 0 THEN 'YES'
CASE WHEN patient_id%2 != 0 THEN 'NO'
END AS has_insurance
FROM admissions,
GROUP BY has_insurance 
























