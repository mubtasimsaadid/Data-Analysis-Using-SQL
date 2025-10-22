# Healthcare Audit System using SQL Trigger 

A comprehensive SQL trigger-based audit trail system designed for healthcare databases, ensuring HIPAA compliance, data integrity, and complete accountability for all patient record modifications.

## Overview

This project implements an automated audit logging system using SQL triggers to track all data modifications (INSERT, UPDATE, DELETE) in a healthcare database. Every change to patient information and medical records is automatically logged with timestamps, user identification, and complete change history.

## How It Works

Whenever a record in ```PATIENTS``` or ```MEDICAL_RECORDS``` is inserted, updated, or deleted:

- The corresponding trigger activates.

- A detailed JSON entry is added to ```AUDIT_LOG``` contaning all the changes.

- The change is timestamped and linked to the current session user (@CURRENT_CHANGED_BY).


## Database Setup

- Create a database named `healthcare`.
```sql
CREATE DATABASE IF NOT EXISTS HEALTHCARE;
USE HEALTHCARE;
```

## Core Tables 
**PATIENTS** 
```sql
CREATE TABLE PATIENTS(
	PATIENT_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    FULL_NAME VARCHAR(50) NOT NULL,
    DOB DATE,
    GENDER CHAR(1),
    EMAIL VARCHAR(50),
    ADDRESS VARCHAR (200),
    LAST_TREATMENT_DATE DATETIME,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
```
**MEDICAL_RECORDS** 
```sql
CREATE TABLE MEDICAL_RECORDS(
	RECORD_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    PATIENT_ID INT,
    DIAGNOSIS VARCHAR(100),
    TREATMENT VARCHAR(100), 
    PRESCRIBED_BY VARCHAR(50),
    RECORD_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
```
**AUDIT_LOG**
```sql
CREATE TABLE AUDIT_LOG (
	LOG_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    TABLE_NAME VARCHAR(50),					  -- FROM WHICH TABLE THE DATA HAS BEEN CHANGED 
    ACTION_TYPE VARCHAR(20), 				  -- INSERT, UPDATE, DELETE		
    ENTITY_ID BIGINT NOT NULL,				-- REFERENCE ID OF PATIENT_ID & RECORD_ID
    CHANGED_DATA JSON,                -- STORES OLD AND CHANGED DATA IN JSON FORMAT
    CHANGED_BY INT, 						      -- ID OF WHOM HAS CHANGED THE DATA
    ACTION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
```
## SETTING CURRENT USER
```sql
SET @CURRENT_CHANGED_BY = 1101;           -- MANUALLY SET CHANGED_BY ID 
```

## TRIGGER IMPLEMENTATION
**INSERT TRIGGER:** Automatically logs data for new patient and medical record registrations.
```sql
TRIGGER 
DELIMITER $$
CREATE TRIGGER patientsinfo_after_insert
AFTER INSERT ON PATIENTS 
FOR EACH ROW BEGIN
    INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
    VALUES(
	'PATIENTS','INSERT',
	NEW.PATIENT_ID,
    JSON_OBJECT('FULL_NAME', NEW.FULL_NAME, 'DOB', NEW.DOB, ...),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
    );
END $$
DELIMITER ;
```

**UPDATE TRIGGER:** When any existing record is updated, triggers captures both old and new values for comparison.
```sql
TRIGGER 
DELIMITER $$
CREATE TRIGGER medicalrecords_after_update
AFTER INSERT ON MEDICAL_RECORDS 
FOR EACH ROW BEGIN
	IF NOT (OLD.RECORD_ID <=> NEW.RECORD_ID AND ...)
	THEN INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
    VALUES(
	'MEDICAL_RECORDS',
	'UPDATE',
	OLD.RECORD_ID,
	JSON_OBJECT('OLD: ', JSON_OBJECT('PATIENT_ID', OLD.PATIENT_ID, 'DIAGNOSIS', OLD.DIAGNOSIS, ....),
	'NEW: ', JSON_OBJECT('PATIENT_ID', NEW.PATIENT_ID, 'DIAGNOSIS', NEW.DIAGNOSIS, ....)),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
    );
	END IF;
END $$
DELIMITER ;
```

**DELETE TRIGGER:** Preserve deleted data for auditing and rollbacks
```sql
TRIGGER 
DELIMITER $$
CREATE TRIGGER patientsinfo_after_delete 
AFTER DELETE ON PATIENTS 
FOR EACH ROW BEGIN 
    INSERT INTO AUDIT_LOG(...)
    VALUES(
	'PATIENTS',
	'DELETE',
	OLD.PATIENT_ID,
	JSON_OBJECT('FULL_NAME', OLD.FULL_NAME, ...),
	IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
    );

END $$
DELIMITER ;
```

## OUTPUT OF ```AUDIT_LOG``` AFTER INITIATING ALL THE TRIGGERS


| LOG_ID | TABLE_NAME     | ACTION_TYPE | ENTITY_ID | CHANGED_DATA                                                                                                                                                                                                                                                                                                                                                                                                           | CHANGED_BY | ACTION_DATE           |
|--------:|----------------|--------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|------------------------|
| 1 | PATIENTS | INSERT | 32 | `{"DOB": "1994-01-31", "EMAIL": "anniemarie@example.com", "ADDRESS": "88 Johnson Rd, Southridge", "FULL_NAME": "Annie Marie"}` | 1101 | 2025-10-22 15:07:39 |
| 2 | PATIENTS | DELETE | 33 | `{"DOB": "2000-10-12", "EMAIL": "john.doe.new@example.com", "ADDRESS": "300 XYZ Street, Boulder Creek", "FULL_NAME": "John Doe"}` | 1210 | 2025-10-22 19:13:48 |
| 3 | MEDICAL_RECORDS | UPDATE | 43 | `{"NEW: ": {"DIAGNOSIS": "Seasonal Allergies", "TREATMENT": "Loratadine 10mg daily, Avoid allergens", "PATIENT_ID": 32, "PRESCRIBED_BY": "Dr. Karen Doyle"}, "OLD: ": {"DIAGNOSIS": "Seasonal Allergies", "TREATMENT": "Loratadine 10mg daily, Avoid allergens"...}` | 1201 | 2025-10-22 20:23:58 |
| 4 | PATIENTS | UPDATE | 30 | `{"NEW: ": {"DOB": "1984-09-23", "EMAIL": "gabriel.n@example.com", "GENDER": "F", "ADDRESS": "12 Stone Gate Pl, Boulder Creek", "FULL_NAME": "Gabriela Nelson", "PATIENT_ID": 30}, "OLD: ": {"DOB": "1984-09-23", "EMAIL": "gabriel.n@example.com", "GENDER": "...}` | 1210 | 2025-10-22 17:27:16 |
| 5 | MEDICAL_RECORDS | INSERT | 43 | `{"DIAGNOSIS": "Seasonal Allergies", "TREATMENT": "Loratadine 10mg daily, Avoid allergens", "PATIENT_ID": 32, "PRESCRIBED_BY": "Dr. Emily Carter"}` | 1101 | 2025-10-22 19:55:47 |


