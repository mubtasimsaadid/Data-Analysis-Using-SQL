# Healthcare Audit System using SQL Trigger 

A comprehensive SQL trigger-based audit trail system designed for healthcare databases, ensuring HIPAA compliance, data integrity, and complete accountability for all patient record modifications.

## Overview

This project implements an automated audit logging system using SQL triggers to track all data modifications (INSERT, UPDATE, DELETE) in a healthcare database. Every change to patient information and medical records is automatically logged with timestamps, user identification, and complete change history.


## Database Setup

- Create a database named `healthcare`.
```sql
CREATE DATABASE IF NOT EXISTS HEALTHCARE;
USE HEALTHCARE;

