# ----------------------------------------------------- TRIGGER: AFTER INSERT ----------------------------------------------------

-- ---------------------------------------------------- FOR PATIENTS TABLE -------------------------------------------------------
TRIGGER 
DELIMITER $$
CREATE TRIGGER patientsinfo_after_insert
AFTER INSERT ON PATIENTS 
FOR EACH ROW BEGIN
    INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
    VALUES(
    'PATIENTS',
    'INSERT',
    NEW.PATIENT_ID,
    JSON_OBJECT('FULL_NAME', NEW.FULL_NAME, 'DOB', NEW.DOB, 'EMAIL', NEW.EMAIL, 'ADDRESS', NEW.ADDRESS),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
    );
    
END $$
DELIMITER ;

-- ---------------------------------------------------- FOR MEDICAL RECORDS TABLE -------------------------------------------------------
TRIGGER 
DELIMITER $$
CREATE TRIGGER medicalrecords_after_insert
AFTER INSERT ON MEDICAL_RECORDS
FOR EACH ROW BEGIN
    INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
    VALUES(
    'MEDICAL_RECORDS',
    'INSERT',
    NEW.RECORD_ID,
    JSON_OBJECT('PATIENT_ID', NEW.PATIENT_ID, 'DIAGNOSIS', NEW.DIAGNOSIS, 'TREATMENT', NEW.TREATMENT, 'PRESCRIBED_BY', NEW.PRESCRIBED_BY),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
    );
    
END $$
DELIMITER ;

# ----------------------------------------------------- TRIGGER: AFTER UPDATE ----------------------------------------------------

-- ---------------------------------------------------- FOR PATIENTS TABLE -------------------------------------------------------
TRIGGER
DELIMITER $$
CREATE TRIGGER patientsinfo_after_update
AFTER UPDATE ON PATIENTS
FOR EACH ROW
BEGIN
    IF NOT (
        OLD.PATIENT_ID <=> NEW.PATIENT_ID AND
        OLD.FULL_NAME <=> NEW.FULL_NAME AND
        OLD.DOB <=> NEW.DOB AND
        OLD.GENDER <=> NEW.GENDER AND
        OLD.EMAIL <=> NEW.EMAIL AND
        OLD.ADDRESS <=> NEW.ADDRESS
    ) THEN
        INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
        VALUES (
            'PATIENTS',
            'UPDATE',
            OLD.PATIENT_ID,
            JSON_OBJECT('OLD: ', JSON_OBJECT('PATIENT_ID', OLD.PATIENT_ID, 'FULL_NAME', OLD.FULL_NAME, 'DOB', OLD.DOB, 'GENDER', OLD.GENDER, 'EMAIL', OLD.EMAIL, 'ADDRESS', OLD.ADDRESS),
			'NEW: ', JSON_OBJECT('PATIENT_ID', NEW.PATIENT_ID, 'FULL_NAME', NEW.FULL_NAME, 'DOB', NEW.DOB, 'GENDER', NEW.GENDER, 'EMAIL', NEW.EMAIL, 'ADDRESS', NEW.ADDRESS)),
            IFNULL(@CURRENT_CHANGED_BY, 0),
            NOW()
        );
    END IF;
END$$
DELIMITER ;

-- ---------------------------------------------------- FOR MEDICAL RECORDS TABLE -------------------------------------------------------
TRIGGER
DELIMITER $$
CREATE TRIGGER medicalrecords_after_update
AFTER UPDATE ON MEDICAL_RECORDS
FOR EACH ROW BEGIN
    IF NOT (
		OLD.RECORD_ID <=> NEW.RECORD_ID AND
        OLD.PATIENT_ID <=> NEW.PATIENT_ID AND
        OLD.DIAGNOSIS <=> NEW.DIAGNOSIS AND
        OLD.TREATMENT <=> NEW.TREATMENT AND
        OLD.PRESCRIBED_BY <=> NEW.PRESCRIBED_BY AND
        OLD.RECORD_DATE <=> NEW.RECORD_DATE
    ) THEN
        INSERT INTO AUDIT_LOG (TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
        VALUES (
            'MEDICAL_RECORDS',
            'UPDATE',
            OLD.RECORD_ID,
            JSON_OBJECT('OLD: ', JSON_OBJECT('PATIENT_ID', OLD.PATIENT_ID, 'DIAGNOSIS', OLD.DIAGNOSIS, 'TREATMENT', OLD.TREATMENT, 'PRESCRIBED_BY', OLD.PRESCRIBED_BY),
			'NEW: ', JSON_OBJECT('PATIENT_ID', NEW.PATIENT_ID, 'DIAGNOSIS', NEW.DIAGNOSIS, 'TREATMENT', NEW.TREATMENT, 'PRESCRIBED_BY', NEW.PRESCRIBED_BY)),
            IFNULL(@CURRENT_CHANGED_BY, 0),
            NOW()
        );
    END IF;
END$$
DELIMITER ;

# ----------------------------------------------------- TRIGGER: AFTER DELETE ----------------------------------------------------

-- ---------------------------------------------------- FOR PATIENTS TABLE -------------------------------------------------------
TRIGGER 
DELIMITER $$
CREATE TRIGGER patientsinfo_after_delete 
AFTER DELETE ON PATIENTS 
FOR EACH ROW BEGIN 
INSERT INTO AUDIT_LOG(TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
VALUES(
	'PATIENTS',
    'DELETE',
    OLD.PATIENT_ID,
	JSON_OBJECT('FULL_NAME', OLD.FULL_NAME, 'DOB', OLD.DOB, 'EMAIL', OLD.EMAIL, 'ADDRESS', OLD.ADDRESS),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
	);
    
END $$
DELIMITER ;

-- ---------------------------------------------------- FOR MEDICAL RECORDS TABLE -------------------------------------------------------
TRIGGER 
DELIMITER $$
CREATE TRIGGER medicalrecords_after_delete 
AFTER DELETE ON MEDICAL_RECORDS
FOR EACH ROW BEGIN 
INSERT INTO AUDIT_LOG(TABLE_NAME, ACTION_TYPE, ENTITY_ID, CHANGED_DATA, CHANGED_BY, ACTION_DATE)
VALUES(
	'MEDICAL_RECORDS',
    'DELETE',
    OLD.RECORD_ID,
	JSON_OBJECT('PATIENT_ID', OLD.PATIENT_ID, 'DIAGNOSIS', OLD.DIAGNOSIS, 'TREATMENT', OLD.TREATMENT, 'PRESCRIBED_BY', OLD.PRESCRIBED_BY),
    IFNULL(@CURRENT_CHANGED_BY, 0),
    NOW()
	);
    
END $$
DELIMITER ;
