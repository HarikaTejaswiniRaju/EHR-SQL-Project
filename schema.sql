--CREATE DATABASE
CREATE DATABASE EHR_Database;
GO

USE EHR_Database;
GO

--Patients Table--
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);


--Doctors Table--
CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(15)
);


-----Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

--Medical Records Table
CREATE TABLE MedicalRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    VisitDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


--Billing Table
CREATE TABLE Billing (
    BillID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    BillDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);