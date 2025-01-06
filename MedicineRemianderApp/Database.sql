-- Create the Medication Reminder App database
CREATE DATABASE MedicationReminderApp;

-- Switch to the database
USE MedicationReminderApp;

-- Users Table: Stores user details
CREATE TABLE Users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('admin', 'user') DEFAULT 'user',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Medicine Table: Tracks medicine details
CREATE TABLE Medicine (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    ScheduleTime TIME NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(ID) ON DELETE CASCADE
);

-- Acknowledgment Logs Table: Stores acknowledgment logs
CREATE TABLE AcknowledgmentLogs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MedicineID INT NOT NULL,
    Status ENUM('taken', 'missed') NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(ID) ON DELETE CASCADE,
    FOREIGN KEY (MedicineID) REFERENCES Medicine(ID) ON DELETE CASCADE
);
