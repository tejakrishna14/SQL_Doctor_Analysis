-- 1.Show unique birth_years for patients and arrange them in descending order
SELECT distinct YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year DESC;

-- 2.Show unique firstname that occur only once in the list
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

-- 3.Show patient id and first name from patient where the first name starts and ends with S and is atleast 6 characters long
SELECT patient_id,first_name
FROM patients
WHERE first_name LIKE 's____%s';

-- 4.Show patient_id firstname lastname from patients whose diagnosis is Pneumonia
SELECT
    p.patient_id,
    p.first_name,
    p.last_name
FROM
    patients as p
JOIN
    admissions as a ON p.patient_id = a.patient_id
WHERE
    a.diagnosis = 'Pneumonia';
    
-- 5.Display every patients firstname and then order by the size of characters and then alphabetically
SELECT first_name
FROM patients
ORDER BY length(first_name), first_name;

-- 6.Show the total number of male patients and the total number of female patients in the patients table display them in the same row
SELECT
	(SELECT COUNT(*) AS Male_Patients FROM patients WHERE gender = "M") AS Male_Patients,
	(SELECT COUNT(*) AS Female_Patients FROM patients WHERE gender = "F") AS Female_Patients;
    
-- 7.Show firstname lastname and allergies from patients which have allergies to either Penicillin or Shellfish. 
-- ordered by ascending by allergies and then by firstname and last name
SELECT first_name,last_name,allergies
FROM patients
WHERE allergies = "Shellfish" OR allergies = "Penicillin"
ORDER BY allergies,first_name,last_name;

-- 8.Show patientid and diagnosis from admission where a patient was admitted multiple times for same diagnosis.
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id,diagnosis 
HAVING COUNT(*) > 1;

-- 9.Show the city and total number of people in the city. Order form most to least patients in that city
SELECT city,COUNT(patient_id) AS number_of_patients
FROM patients
GROUP BY city
ORDER BY number_of_patients DESC,city ASC;

-- 10.Show the firstname lastname and role of every person that is either doctor or patient 
SELECT first_name,last_name, 'Patient' AS Role
FROM patients

UNION ALL

SELECT first_name,last_name, 'Doctor' AS Role
FROM doctors;

-- 11.Show all the allergies ordered by popularity. Remove null values from query
SELECT allergies, COUNT(*) AS Total_Diagnosis
FROM patients
WHERE allergies is not null
GROUP BY allergies
ORDER BY Total_Diagnosis ASC;

-- 12.Show firstname lastname and date of birth who were born in 1970s decade and order by earliest dob
SELECT first_name,last_name,birth_date
FROM patients 
WHERE YEAR(birth_date)>=1970 AND YEAR(birth_date)<1980
ORDER BY YEAR(birth_date);

-- 13.Dispplay each patient full name in single column and lastname in upper letter must appear first and then firstname in lowercase seperated by a ,
--  order the firstname in descending order
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS Full_name
FROM patients
ORDER BY first_name;

-- 14.Show the province_id sum of heights where the total sum of height is greater than or equal to 170
SELECT province_id,SUM(height) as Height
FROM patients
GROUP BY province_id 
HAVING SUM(height) >= 170;

-- 15.Show the difference between the largest weight and smallest weight for patients lastname rahul (Assuming there are multiple people named rahul)
SELECT MAX(weight) - MIN(weight) AS Weight_Difference
FROM patients
WHERE last_name = "rahul";

-- 16.Show all the days of the month and how many admission_dates occured on that day. Sort by most admission to least admissions
SELECT DAY(admission_date) AS Day_Number,
COUNT(*) AS number_of_admissions
FROM admissions
GROUP BY Day_Number
ORDER BY number_of_admissions DESC;

-- 17.Show all the columns for the patient id 106 most recent admission date (Re-Verify)
SELECT * FROM admissions
WHERE patient_id = 106
GROUP BY patient_id
HAVING admission_date = MAX(admission_date);





