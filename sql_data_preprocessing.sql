-- Create database
CREATE DATABASE IF NOT EXISTS PharmacySales;

-- Create the sales_data table
CREATE TABLE sales_data (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    Typeofsales VARCHAR(255),
    Patient_ID VARCHAR(255), -- Patient_ID as a VARCHAR to handle numeric-like strings
    Specialisation VARCHAR(255),
    Dept VARCHAR(255),
    Dateofbill VARCHAR(255), -- Temporarily storing Dateofbill as VARCHAR to handle various date formats
    Quantity INT,
    ReturnQuantity INT,
    Final_Cost DECIMAL(10, 2),
    Final_Sales DECIMAL(10, 2),
    RtnMRP DECIMAL(10, 2),
    Formulation VARCHAR(255),
    DrugName VARCHAR(255),
    SubCat VARCHAR(255),
    SubCat1 VARCHAR(255)
);

-- Adding a new column for standardized date format
ALTER TABLE sales_data ADD Dateofbill_new DATE;

-- Populating the new date column by converting the original Dateofbill values
UPDATE sales_data
SET Dateofbill_new = STR_TO_DATE(REPLACE(Dateofbill,'/','-'), '%m-%d-%Y')
WHERE Dateofbill IS NOT NULL;

-- Dropping the old Dateofbill column which was in VARCHAR format
ALTER TABLE sales_data DROP COLUMN Dateofbill;

-- Renaming the new date column to Dateofbill
ALTER TABLE sales_data CHANGE Dateofbill_new Dateofbill DATE;

-- Deleting rows with any NULL or empty values 
DELETE FROM sales_data
WHERE Typeofsales IS NULL OR Typeofsales = ''
   OR Patient_ID IS NULL OR Patient_ID = ''
   OR Specialisation IS NULL OR Specialisation = ''
   OR Dept IS NULL OR Dept = ''
   OR Quantity IS NULL
   OR ReturnQuantity IS NULL
   OR Final_Cost IS NULL
   OR Final_Sales IS NULL
   OR RtnMRP IS NULL
   OR Formulation IS NULL OR Formulation = ''
   OR DrugName IS NULL OR DrugName = ''
   OR SubCat IS NULL OR SubCat = ''
   OR SubCat1 IS NULL OR SubCat1 = ''
   OR Dateofbill IS NULL;

-- Deleting duplicate rows based on all columns except SalesID
DELETE FROM sales_data
WHERE (Typeofsales, Patient_ID, Specialisation, Dept, Quantity, 
       ReturnQuantity, Final_Cost, Final_Sales, RtnMRP, Formulation, 
       DrugName, SubCat, SubCat1, Dateofbill) IN (
    SELECT t.Typeofsales, t.Patient_ID, t.Specialisation, t.Dept, t.Quantity, 
           t.ReturnQuantity, t.Final_Cost, t.Final_Sales, t.RtnMRP, t.Formulation, 
           t.DrugName, t.SubCat, t.SubCat1, t.Dateofbill
    FROM (
        SELECT Typeofsales, Patient_ID, Specialisation, Dept, Quantity, 
               ReturnQuantity, Final_Cost, Final_Sales, RtnMRP, Formulation, 
               DrugName, SubCat, SubCat1, Dateofbill
        FROM sales_data
        GROUP BY Typeofsales, Patient_ID, Specialisation, Dept, Quantity, 
                 ReturnQuantity, Final_Cost, Final_Sales, RtnMRP, Formulation, 
                 DrugName, SubCat, SubCat1, Dateofbill
        HAVING COUNT(*) > 1
    ) AS t
);

-- Displaying the first 10 rows to review the current state of the data
SELECT * FROM sales_data LIMIT 10;

-- Counting the total number of rows to ensure data integrity after preprocessing
SELECT COUNT(*) FROM sales_data;

-- Describing the sales_data table to review its current structure
DESCRIBE sales_data;

-- Retrieve a list of unique values from the SubCat1 column
SELECT DISTINCT SubCat1 FROM sales_data;
