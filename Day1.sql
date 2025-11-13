create database Hospital;
use hospital;
create table Patients(
PatientID int,
PatientName varchar(50),
 Age int,
 Gender varchar(10),
 AdmissionDate date);
 alter table patients add column( DoctorAssigned VARCHAR(50));
 alter table patients modify patientName varchar(100) ;
 rename table Patients to Patients_info;
 truncate Patients_info;