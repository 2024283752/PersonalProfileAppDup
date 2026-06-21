-- =====================================================
-- CSC584 Assignment 2 - Database Script
-- Student: Nuratikah Aqilah Binti Awg Morni
-- Student ID: 2024283752
-- Database: StudentProfilesDB
-- Date: 21 June 2026
-- =====================================================

-- =====================================================
-- 1. CREATE DATABASE (for Derby)
-- =====================================================
-- In NetBeans, create database using:
-- Right-click Java DB -> Create Database
-- Database Name: StudentProfilesDB
-- User Name: app
-- Password: app

-- =====================================================
-- 2. CREATE TABLE
-- =====================================================

CREATE TABLE Profile (
    studentID VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hobbies VARCHAR(255),
    introduction VARCHAR(500)
);

-- =====================================================
-- 3. INSERT SAMPLE DATA
-- =====================================================

INSERT INTO Profile VALUES (
    '2024283752',
    'Nuratikah Aqilah Binti Awg Morni',
    'Software Engineering',
    'aqilahmorni@gmail.com',
    'Music, Travel',
    'I love pink and exploring new places!'
);

INSERT INTO Profile VALUES (
    '2024787443',
    'Nurafiqah Athirah Binti Awg Morni',
    'Information Technology',
    'afiqahmorni@gmail.com',
    'Reading, Gaming',
    'I love purple and reading books!'
);

INSERT INTO Profile VALUES (
    '2023757688',
    'Nurhani Afifah Binti Awg Morni',
    'Data Science',
    'haniafah@gmail.com',
    'Music, Coding',
    'I love studying and cycling!'
);

-- =====================================================
-- 4. QUERY TO VIEW ALL RECORDS
-- =====================================================

SELECT * FROM Profile;

-- =====================================================
-- 5. ADDITIONAL QUERIES (For Testing)
-- =====================================================

-- Search by Student ID
SELECT * FROM Profile WHERE studentID = '2024283752';

-- Search by Name (partial match)
SELECT * FROM Profile WHERE LOWER(name) LIKE '%aqilah%';

-- Filter by Programme
SELECT * FROM Profile WHERE LOWER(programme) = 'software engineering';

-- Filter by Hobby
SELECT * FROM Profile WHERE LOWER(hobbies) LIKE '%music%';

-- Count total records
SELECT COUNT(*) AS TotalProfiles FROM Profile;

-- =====================================================
-- 6. DELETE / DROP (Use with caution - commented out)
-- =====================================================

-- Delete all records (use with caution)
-- DELETE FROM Profile;

-- Drop table (use with caution)
-- DROP TABLE Profile;

-- =====================================================
-- END OF DATABASE SCRIPT
-- =====================================================
