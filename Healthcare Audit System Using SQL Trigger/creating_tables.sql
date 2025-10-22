# -------------------------------------PATIENTS TABLE------------------------------------------
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
    
INSERT INTO PATIENTS (FULL_NAME, DOB, GENDER, EMAIL, ADDRESS) 
VALUES
('Ethan Williams', '1985-04-12', 'M', 'ethan.williams@example.com', '45 Pine St, Apartment 3B, Anytown'),
('Olivia Davis', '1992-11-20', 'F', 'olivia.davis@example.com', '101 Oak Ave, Unit 7, Smallville'),
('Alexander Chen', '1973-01-05', 'M', 'alex.chen@example.com', '789 Maple Ln, Greenville'),
('Sophia Garcia', '2001-07-28', 'F', 'sophia.g@example.com', '22 Elm Rd, Suite 500, Metro City'),
('Noah Johnson', '1960-09-15', 'M', 'noah.j@example.com', '33 Cherry Blossom Blvd, Old Town'),
('Emma Rodriguez', '1998-03-03', 'F', 'emma.rodriguez@example.com', '876 Birch Ct, Riverside'),
('Liam Smith', '2015-05-18', 'M', 'liam.s@example.com', '11 Willow Way, Apartment 2A, Anytown'),
('Ava Brown', '1988-12-01', 'F', 'ava.brown@example.com', '555 Cedar St, Block C, Big City'),
('William Jones', '1954-06-25', 'M', 'william.j@example.com', '99 Poplar Dr, Suburbia'),
('Isabella Miller', '2005-02-14', 'F', 'bella.m@example.com', '432 Aspen Ln, The Heights'),
('James Wilson', '1979-10-10', 'M', 'james.wilson@example.com', '123 Forest Ave, Unit 12, West Side'),
('Charlotte Moore', '1995-08-22', 'F', 'charlotte.m@example.com', '70 Garden Path, East End'),
('Benjamin Taylor', '1967-04-04', 'M', 'ben.t@example.com', '60 Water St, Pier 1, Harbor Town'),
('Mia Thomas', '2010-01-30', 'F', 'mia.thomas@example.com', '21 Sunrise Blvd, Apt 10D, North City'),
('Jacob Hernandez', '1982-07-07', 'M', 'jacob.h@example.com', '88 Sunset Rd, Southridge'),
('Amelia Martin', '1990-05-09', 'F', 'amartin@example.com', '14 Ocean View Dr, Coastside'),
('Lucas Jackson', '1950-11-29', 'M', 'lucas.j@example.com', '18 Old Mill Rd, Rural Area'),
('Harper Lee', '2003-09-17', 'F', 'harper.lee@example.com', '25 Hilltop Terrace, Valley Town'),
('Henry White', '1975-02-08', 'M', 'henry.w@example.com', '40 Main St, Suite 201, Downtown'),
('Evelyn Hall', '1980-08-11', 'F', 'evelyn.h@example.com', '10 Pinehurst Ct, Golfside'),
('Andrew Harris', '1994-12-06', 'M', 'andrew.h@example.com', '333 Riverwalk Way, Apt 6F, Midtown'),
('Abigail Clark', '1965-03-24', 'F', 'abigail.c@example.com', '7 Silver Stream Pl, Mountain View'),
('Daniel Lewis', '1999-06-01', 'M', 'daniel.l@example.com', '1 Green Field Cir, Farmstead'),
('Emily Walker', '2012-10-16', 'F', 'emily.w@example.com', '444 Blue Sky Blvd, Lakeside'),
('Michael King', '1970-12-28', 'M', 'michael.k@example.com', '90 Grand Ave, Penthouse, Uptown'),
('Chloe Allen', '1987-04-20', 'F', 'chloe.a@example.com', '5 Goldenrod Ln, Meadowlands'),
('Joshua Young', '1963-01-19', 'M', 'joshua.y@example.com', '17 Heritage Dr, Historic District'),
('Zoe Baker', '2008-07-02', 'F', 'zoe.baker@example.com', '20 Star Gazer Way, Planetarium City'),
('Riley Scott', '1996-02-29', 'M', 'riley.s@example.com', '66 Rainbow Rd, Harmony Village'),
('Gabriel Nelson', '1984-09-23', 'M', 'gabriel.n@example.com', '12 Stone Gate Pl, Boulder Creek');


# ------------------------------------------- MEDICAL RECORDS TABLE ----------------------------------------------------
CREATE TABLE MEDICAL_RECORDS(
	RECORD_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    PATIENT_ID INT,
    DIAGNOSIS VARCHAR(100),
    TREATMENT VARCHAR(100), 
    PRESCRIBED_BY VARCHAR(50),
    RECORD_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO MEDICAL_RECORDS (PATIENT_ID, DIAGNOSIS, TREATMENT, PRESCRIBED_BY, RECORD_DATE) VALUES
(1, 'Common Cold', 'Antihistamine, Rest, Fluids', 'Dr. Sarah Hayes', '2025-01-05'),
(1, 'Migraine', 'Paracetamol 500mg, Sleep Management', 'Dr. Nathan Allen', '2025-03-20'),
(2, 'Hypertension', 'Losartan 50mg daily', 'Dr. Tyler Crawford', '2025-02-12'),
(2, 'High Cholesterol', 'Atorvastatin 10mg daily', 'Dr. Sarah Hayes', '2025-04-10'),
(3, 'Type 2 Diabetes', 'Metformin 500mg twice daily', 'Dr. Megan Hoffman', '2025-05-15'),
(4, 'Asthma', 'Salbutamol Inhaler, Avoid Triggers', 'Dr. Frank Ramsey', '2025-01-22'),
(5, 'Seasonal Allergy', 'Loratadine 10mg once daily', 'Dr. Rachel King', '2025-06-18'),
(6, 'Arthritis', 'Pain Management + Physical Therapy', 'Dr. Zachary Adams', '2025-02-28'),
(7, 'Gastric Ulcer', 'Omeprazole 20mg daily', 'Dr. Matthew Raymond', '2025-07-10'),
(7, 'Back Pain', 'Ibuprofen 400mg + Physiotherapy', 'Dr. Thomas Irving', '2025-08-22'),
(8, 'Anemia', 'Iron Supplement + Diet Plan', 'Dr. Rebecca Ingram', '2025-03-11'),
(9, 'COVID-19', 'Rest, Paracetamol, Steam Inhalation', 'Dr. Fiona Hudson', '2025-04-05'),
(10, 'Thyroid Disorder', 'Levothyroxine 75mcg daily', 'Dr. Nicole Simmons', '2025-05-09'),
(3, 'Obesity', 'Diet, Exercise, Behavioral Therapy', 'Dr. John Carter', '2025-06-25'),
(4, 'Bronchitis', 'Antibiotics, Cough Syrup, Rest', 'Dr. Emily Scott', '2025-07-14'),
(5, 'Depression', 'Sertraline 50mg, Therapy', 'Dr. Laura Bennett', '2025-08-03'),
(6, 'Eczema', 'Topical Steroids, Moisturizers', 'Dr. Kevin Mitchell', '2025-08-19'),
(8, 'Osteoporosis', 'Calcium, Vitamin D, Bisphosphonates', 'Dr. Amanda Brooks', '2025-09-01'),
(9, 'Sleep Apnea', 'CPAP, Weight Loss, Sleep Hygiene', 'Dr. Brian Peterson', '2025-09-10'),
(10, 'Urinary Tract Infection', 'Antibiotics (Nitrofurantoin)', 'Dr. Jessica Reed', '2025-09-28'),
(11, 'Sinusitis', 'Decongestants, Nasal Spray', 'Dr. Daniel Morgan', '2025-10-01'),
(12, 'Psoriasis', 'Topical Creams, Light Therapy', 'Dr. Kelly White', '2025-10-06'),
(13, 'GERD', 'Omeprazole, Dietary Changes', 'Dr. Robert Lee', '2025-10-12'),
(14, 'Anxiety Disorder', 'Cognitive Behavioral Therapy, SSRIs', 'Dr. Michelle Young', '2025-10-18'),
(15, 'Hypertension', 'Amlodipine 5mg daily', 'Dr. Olivia Parker', '2025-10-05'),
(15, 'Type 2 Diabetes', 'Metformin 850mg twice daily', 'Dr. Olivia Parker', '2025-10-15'),
(16, 'Acid Reflux', 'Ranitidine 150mg, Avoid Spicy Foods', 'Dr. Michael Stone', '2025-08-22'),
(17, 'Allergic Rhinitis', 'Antihistamines, Nasal Spray', 'Dr. Karen Doyle', '2025-07-29'),
(18, 'Sciatica', 'Physical Therapy, NSAIDs', 'Dr. Henry Caldwell', '2025-09-12'),
(18, 'Insomnia', 'Melatonin 3mg, Sleep Routine', 'Dr. Elise Porter', '2025-10-09'),
(19, 'Pneumonia', 'Antibiotics, Rest, Hydration', 'Dr. James Elliott', '2025-08-17'),
(20, 'Hyperthyroidism', 'Methimazole 10mg daily', 'Dr. Natalie Griffin', '2025-09-03'),
(21, 'Chronic Fatigue Syndrome', 'CBT, Graded Exercise Therapy', 'Dr. Laura Scott', '2025-07-11'),
(22, 'Urinary Incontinence', 'Pelvic Floor Exercises, Oxybutynin', 'Dr. Samuel Greene', '2025-10-01'),
(23, 'Gout', 'Allopurinol 100mg daily, Diet Control', 'Dr. Rachel Adams', '2025-08-05'),
(24, 'Irritable Bowel Syndrome', 'Low FODMAP Diet, Fiber Supplement', 'Dr. Andrew Nelson', '2025-09-16'),
(25, 'Tension Headache', 'Ibuprofen, Stress Reduction', 'Dr. Megan Chase', '2025-06-25'),
(26, 'Otitis Media', 'Amoxicillin 500mg, Pain Relief', 'Dr. Brian Walsh', '2025-07-18'),
(27, 'Dermatitis', 'Hydrocortisone Cream, Allergen Avoidance', 'Dr. Katherine Moore', '2025-08-14'),
(28, 'Menstrual Cramps', 'Ibuprofen, Heat Therapy', 'Dr. Amanda Foster', '2025-09-21'),
(29, 'Plantar Fasciitis', 'Stretching, Orthotics, NSAIDs', 'Dr. Steven Wallace', '2025-08-30'),
(30, 'Chronic Sinusitis', 'Nasal Corticosteroids, Saline Rinse', 'Dr. Jessica Monroe', '2025-10-20');

# ----------------------------------------------------------------------------------------------------------------------------------

-- UPDATES LATEST TREATMENT DATE OF PATIENT FROM MEDICAL_RECORDS TABLE TO PATIENT TABLE
UPDATE PATIENTS P
SET LAST_TREATMENT_DATE = (SELECT MAX(M.RECORD_DATE) FROM MEDICAL_RECORDS M WHERE M.PATIENT_ID = P.PATIENT_ID);



# -------------------------------------------------------- LOG TABLE (TABLE FOR DATA CHANGE RECORDS) ---------------------------------------------------------------
CREATE TABLE AUDIT_LOG (
	LOG_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    TABLE_NAME VARCHAR(50),					  -- FROM WHICH TABLE THE DATA HAS BEEN CHANGED 
    ACTION_TYPE VARCHAR(20), 				  -- INSERT, UPDATE, DELETE		
    ENTITY_ID BIGINT NOT NULL,				  -- REFERENCE ID OF PATIENT_ID & RECORD_ID
    CHANGED_DATA JSON,                        -- STORES OLD AND CHANGED DATA IN JSON FORMAT
    CHANGED_BY INT, 						  -- ID OF WHOM HAS CHANGED THE DATA
    ACTION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);