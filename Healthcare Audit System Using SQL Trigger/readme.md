# Healthcare Audit System using SQL Trigger 

A comprehensive SQL trigger-based audit trail system designed for healthcare databases, ensuring HIPAA compliance, data integrity, and complete accountability for all patient record modifications.

## Overview

This project implements an automated audit logging system using SQL triggers to track all data modifications (INSERT, UPDATE, DELETE) in a healthcare database. Every change to patient information and medical records is automatically logged with timestamps, user identification, and complete change history.


## Database Setup

- Create a database named `healthcare`.
```sql
CREATE DATABASE IF NOT EXISTS HEALTHCARE;
USE HEALTHCARE;
```

## Database Schema
# Core Tables 
# PATIENTS 
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
# MEDICAL_RECORDS 
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
# AUDIT_LOG
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


