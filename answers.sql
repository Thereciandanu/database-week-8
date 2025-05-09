CREATE DATABASE clinicDB;

USE clinicDB;

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email) VALUES
('Alice', 'Wanjiku', '1990-05-12', 'Female', '0712345678', 'alice@example.com'),
('Brian', 'Otieno', '1985-11-23', 'Male', '0723456789', 'brian@example.com'),
('Cynthia', 'Mutiso', '1992-07-19', 'Female', '0734567890', 'cynthia@example.com'),
('Daniel', 'Mwangi', '1978-03-01', 'Male', '0745678912', 'daniel@example.com'),
('Eunice', 'Kariuki', '1989-08-14', 'Female', '0756789123', 'eunice@example.com'),
('Frank', 'Kiptoo', '1994-10-07', 'Male', '0767891234', 'frank@example.com'),
('Grace', 'Njoki', '1996-02-22', 'Female', '0778912345', 'grace@example.com'),
('Henry', 'Odhiambo', '1983-12-15', 'Male', '0789123456', 'henry@example.com'),
('Irene', 'Muthoni', '1991-09-09', 'Female', '0791234567', 'irene@example.com'),
('James', 'Maina', '1987-06-30', 'Male', '0700123456', 'james@example.com');


CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Doctors (first_name, last_name, specialization, phone, email) VALUES
('David', 'Mwangi', 'Cardiologist', '0745678901', 'david@clinic.com'),
('Esther', 'Kilonzo', 'Dentist', '0756789012', 'esther@clinic.com'),
('Kennedy', 'Otieno', 'General Practitioner', '0767890123', 'kennedy@clinic.com'),
('Lilian', 'Chebet', 'Dermatologist', '0778901234', 'lilian@clinic.com'),
('Mark', 'Wekesa', 'Neurologist', '0789012345', 'mark@clinic.com'),
('Nancy', 'Kamau', 'Gynecologist', '0790123456', 'nancy@clinic.com');


CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-05-10 09:00:00', 'Scheduled', 'Routine heart checkup'),
(2, 2, '2025-05-11 11:30:00', 'Scheduled', 'Tooth extraction'),
(3, 3, '2025-05-12 14:00:00', 'Completed', 'Fever and flu'),
(4, 4, '2025-05-13 10:15:00', 'Scheduled', 'Skin rash'),
(5, 5, '2025-05-14 12:45:00', 'Scheduled', 'Migraine issues'),
(6, 6, '2025-05-15 13:00:00', 'Scheduled', 'Routine gyne check'),
(7, 1, '2025-05-16 15:30:00', 'Scheduled', 'High BP concern'),
(8, 3, '2025-05-17 08:45:00', 'Cancelled', 'Cold symptoms'),
(9, 2, '2025-05-18 11:00:00', 'Scheduled', 'Cavity filling'),
(10, 4, '2025-05-19 09:30:00', 'Scheduled', 'Acne treatment');


CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO Treatments (treatment_name, description) VALUES
('Blood Pressure Check', 'Routine BP monitoring.'),
('Tooth Extraction', 'Removal of decayed tooth.'),
('Flu Medication', 'Prescription for flu symptoms.'),
('Skin Cream', 'Topical treatment for rashes.'),
('MRI Scan', 'Neurological scan.'),
('Pregnancy Ultrasound', 'Routine pregnancy imaging.'),
('Tooth Filling', 'Fill cavities in teeth.'),
('Acne Treatment', 'Medication for acne.'),
('Heart ECG', 'Cardiac checkup test.'),
('Vaccination', 'Routine immunization.');


CREATE TABLE Appointment_Treatments (
    appointment_id INT NOT NULL,
    treatment_id INT NOT NULL,
    PRIMARY KEY (appointment_id, treatment_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id) ON DELETE CASCADE
);

INSERT INTO Appointment_Treatments (appointment_id, treatment_id) VALUES
(1, 1),
(1, 9),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 1),
(7, 9),
(8, 3),
(9, 7),
(9, 2),
(10, 8),
(10, 4);