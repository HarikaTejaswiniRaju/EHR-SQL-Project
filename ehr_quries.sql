--Most visited doctor
SELECT d.DoctorName, COUNT(*) AS TotalVisits
FROM Appointments a
JOIN Doctors d 
ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorName
ORDER BY TotalVisits DESC;
--Busiest day
SELECT 
AppointmentDate,
COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY AppointmentDate
ORDER BY TotalAppointments DESC;
--Most common diagnosis
SELECT 
Diagnosis,
COUNT(*) AS TotalCases
FROM MedicalRecords
GROUP BY Diagnosis
ORDER BY TotalCases DESC;
--Revenue by doctor
SELECT 
d.DoctorName,
SUM(b.Amount) AS TotalRevenue
FROM Billing b
JOIN Appointments a 
ON b.PatientID = a.PatientID
JOIN Doctors d 
ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorName
ORDER BY TotalRevenue DESC;
--Monthly revenue
SELECT 
MONTH(BillDate) AS Month,
SUM(Amount) AS TotalRevenue
FROM Billing
GROUP BY MONTH(BillDate)
ORDER BY Month;
--Patients per doctor
SELECT 
d.DoctorName,
COUNT(DISTINCT a.PatientID) AS TotalPatients
FROM Appointments a
JOIN Doctors d 
ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorName
ORDER BY TotalPatients DESC;
--Appointment Count Per Month
SELECT 
MONTH(AppointmentDate) AS Month,
COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY MONTH(AppointmentDate)
ORDER BY Month;

--Most Visited Doctor--

SELECT d.DoctorName, COUNT(*) AS TotalVisits
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
GROUP BY d.DoctorName
ORDER BY TotalVisits DESC;