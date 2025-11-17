
create database Hospital;
use Hospital;

CREATE TABLE Patients(
		PatientID integer unique,
        PatientName VARCHAR(50),
        Age numeric,
        Gender VARCHAR(10),
        AdmissionDate DATE);

Select * from Patients;

-- ALTER:Add Column

ALTER TABLE Patients ADD (DoctorAssigned VARCHAR(50));

-- ALTER:Modify Column

ALTER TABLE Patients modify Column PatientName VARCHAR(100);

-- RENAME Table

RENAME Table Patients to Patient_Info;
Select * from Patient_Info;

-- TRUNCATE vs DROP
-- Truncate:
TRUNCATE TABLE Patient_Info;

-- Drop:
DROP TABLE Patient_Info;