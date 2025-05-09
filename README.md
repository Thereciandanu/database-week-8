Clinic Booking System
A relational database system built with MySQL to manage clinic appointments, patients, doctors, and treatments.

Project Desrciption
This project is a full-featured Clinic Booking System developed using MySQL. It allows for managing:
- Patient records
- Doctor details and specializations
- Appointment scheduling
- Treatments assigned to appointments

It demonstrates relationships including:
- One-to-Many (e.g., a doctor can have many appointments)
- Many-to-Many (e.g., an appointment can have multiple treatments)

Technologies Used
MySQL Workbench-for creating the database. 
Draw.io-for developing the Entity Relationship Diagram(ERD).
Visual Studio Code(VS Code)- code editor.
Git/GitHub- for storing and managing the code.

I was able to test a few queries in this way:
USE clinicDB;

SELECT * FROM Appointments;
SELECT * FROM Doctors;
SELECT * FROM Patients;
In this way, it worked perfectly.
